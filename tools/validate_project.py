from pathlib import Path
import json
import re

def read_gm(path):
    # GameMaker permits trailing commas; remove only commas outside strings.
    text = path.read_text(encoding="utf-8-sig")
    result = []
    quoted = escaped = False
    for i, char in enumerate(text):
        if quoted:
            result.append(char)
            if escaped: escaped = False
            elif char == "\\": escaped = True
            elif char == '"': quoted = False
        else:
            if char == '"': quoted = True
            if char == "," and text[i+1:].lstrip().startswith(("}", "]")): continue
            result.append(char)
    return json.loads("".join(result))

EVENT_PREFIXES = {
    0: "Create", 1: "Destroy", 2: "Alarm", 3: "Step", 5: "Keyboard",
    6: "Mouse", 7: "Other", 8: "Draw", 9: "KeyPress", 10: "KeyRelease",
    12: "CleanUp", 13: "Gesture", 14: "PreCreate",
}


def validate_object_events(path, event_list):
    for event in event_list:
        event_type = event["eventType"]
        if event_type == 4:
            filename = f"Collision_{event['collisionObjectId']['name']}.gml"
        elif event_type in EVENT_PREFIXES:
            filename = f"{EVENT_PREFIXES[event_type]}_{event['eventNum']}.gml"
        else:
            continue
        source = path.parent / filename
        assert source.is_file(), f"Missing event source: {source}"


root = Path(__file__).resolve().parents[1]
project = read_gm(root / "Five Nights at ESCOM.yyp")
declared_paths = {resource["id"]["path"] for resource in project["resources"]}
resource_dirs = {
    "animcurves", "extensions", "fonts", "notes", "objects", "particles",
    "paths", "rooms", "scripts", "sequences", "shaders", "sounds", "sprites",
    "tilesets", "timelines",
}
for directory in resource_dirs:
    for descriptor in (root / directory).glob("*/*.yy"):
        relative_path = descriptor.relative_to(root).as_posix()
        assert relative_path in declared_paths, f"Unregistered resource: {relative_path}"
for resource in project["resources"]:
    path = root / resource["id"]["path"]
    assert path.is_file(), f"Missing resource: {path}"
    metadata = read_gm(path)
    if metadata["resourceType"] == "GMObject":
        validate_object_events(path, metadata["eventList"])
for room in project["RoomOrderNodes"]:
    assert (root / room["roomId"]["path"]).is_file()
for path in root.glob("objects/*/*.gml"):
    assert not re.search(r"^(<{7}|={7}|>{7})(?: |$)", path.read_text(encoding="utf-8-sig"), re.M), f"Merge conflict: {path}"
print(f"Validated {len(project['resources'])} resource files, object event sources, room order and GML conflict markers.")
print("Static validation only: no GameMaker compilation or runtime test.")
