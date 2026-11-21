"""Validate QA records tied to the GameMaker files reviewed in a pull request."""

import argparse
import hashlib
import re
import subprocess


GAME_PATHS = (
    "Five Nights at ESCOM.yyp", "Five Nights at ESCOM.resource_order",
    "animcurves", "datafiles", "extensions", "fonts", "objects", "options",
    "particles", "paths", "rooms", "scripts", "sequences", "shaders", "sounds",
    "sprites", "tilesets", "timelines",
)


def git(*args):
    return subprocess.check_output(["git", *args])


def game_digest(revision):
    return hashlib.sha256(git("ls-tree", "-rz", revision, "--", *GAME_PATHS)).hexdigest()


def record_error(record, expected_digest):
    if f"Game tree SHA-256: `{expected_digest}`" not in record.splitlines():
        return "game tree SHA-256 does not match"
    cases = re.findall(
        r"^\|\s*(QA-[A-Z0-9-]+)\s*\|\s*(PASS|FAIL|N/A|PENDING)\s*\|([^|]*)\|([^|]*)\|\s*$",
        record, re.MULTILINE,
    )
    if not cases or not any(status == "PASS" for _, status, _, _ in cases):
        return "at least one case needs a passing result"
    if len({case for case, *_ in cases}) != len(cases):
        return "case IDs must be unique"
    for case, status, environment, evidence in cases:
        if status in {"FAIL", "PENDING"}:
            return f"{case} is {status}"
        if not environment.strip() or not evidence.strip():
            return f"{case} needs an environment and result or reason for N/A"
    declared_rows = sum(line.lstrip().startswith("| QA-") for line in record.splitlines())
    if len(cases) != declared_rows:
        return "one or more case rows are incomplete"
    return None


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("revisions", nargs="+")
    parser.add_argument("--digest", action="store_true")
    args = parser.parse_args()
    if args.digest and len(args.revisions) == 1:
        print(game_digest(args.revisions[0]))
        return
    if args.digest or len(args.revisions) != 2:
        parser.error("use --digest COMMIT or BASE HEAD")

    base, head = args.revisions
    merge_base = git("merge-base", base, head).decode().strip()
    digest = game_digest(head)
    if game_digest(merge_base) == digest:
        print("GameMaker files unchanged. No new QA record required.")
        return

    records = git(
        "diff", "--name-only", "--diff-filter=AM", "-z", merge_base, head,
        "--", "docs/qa/*.md",
    ).decode().split("\0")
    problems = []
    for path in filter(None, records):
        record = git("show", f"{head}:{path}").decode("utf-8-sig")
        problem = record_error(record, digest)
        if problem is None:
            print(f"QA record verified: {path}")
            return
        problems.append(f"{path}: {problem}")
    for problem in problems:
        print(problem)
    raise SystemExit(f"Add a completed QA record under docs/qa/ for game tree {digest}.")


if __name__ == "__main__":
    main()
