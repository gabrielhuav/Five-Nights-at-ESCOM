# Evidencia de QA para cambios en GameMaker

Para un PR que modifica el juego, agrega un registro Markdown en esta carpeta. Después de guardar el código probado en un commit, ejecuta `python tools/validate_qa.py --digest HEAD`. Copia el resultado en el registro. El identificador sigue siendo válido al editar sólo la documentación.

Registra los casos que cubren el alcance del cambio. Incluye la plataforma, la versión o el dispositivo y el resultado observado. Si un caso queda pendiente, usa `PENDING`. Si el caso no aplica, explica el motivo junto a `N/A`.

```markdown
Game tree SHA-256: `DIGEST`

| Caso | Estado | Entorno | Resultado observado o motivo |
|---|---|---|---|
| QA-EXAMPLE | PENDING | Windows, GameMaker LTS | Pendiente de ejecución |
```

El control automático vincula el registro con los archivos jugables del PR y comprueba que los casos registrados tengan resultados. Las capturas, los videos y los registros del motor sustentan la revisión de los casos.
