# Entrega 1 — Parte 1: Material visual, historia de usuario y evidencias

**Equipo:** -
**Integrantes:** 
* Chávez Romero Jonathan - 2024630102 
* Moreno Noguerón Ximena - 2024630201 
* Reyes Castellanos José Abel - 2020311353
**Repositorio:** https://github.com/xime-ngrn/Five-Nights-at-ESCOM-Forked
**Última actualización:** 29/09/2026

---

## 1.2 Material visual de la idea

Las imágenes van en `docs/evidencias/img/bocetos/`. Cada una lleva un pie con **qué es** y
**quién la elaboró**; y si se generó o retocó con IA.

### Bocetos de pantallas principales

| # | Pantalla | Archivo | Pie de imagen |
|---|---|---|---|
| 1 | Menú principal con Continuar | `img/` | Menú con "Nueva partida", "Continuar (Noche N)" y "Salir". Elaborado por Jonathan a mano. |
| 2 | Selector / anuncio de noche | `img/` | Transición "Noche 2" antes de entrar a la oficina. Elaborado por Jonathan en Figma. |
| 3 | Pantalla de juego (oficina) | `img/` | Oficina con botones de cámara y láser, batería y reloj. Elaborado por Ximena. |
| 4 | Monitor de cámaras | `img/` | Mapa con las 19 cámaras y la cámara activa. Elaborado por Abel. |
| 5 | Pantalla de victoria | `img/` | "6 AM — Noche superada", guardado del avance. Elaborado por Jonathan. |

### Recorrido del usuario

1. El jugador selecciona **Nuevo Juego** y entra a la oficina.
2. Durante la ronda, vigila las cámaras, usa el láser y administra la batería hasta las 6 AM.
3. Si supera la Noche 1, el juego guarda el avance y habilita **Continuar** para entrar a la Noche 2.
4. Si un enemigo lo alcanza, aparece la pantalla de derrota y puede volver al menú.

## 1.3 Historia de usuario y criterio de aceptación

Como jugador, quiero que el juego conserve las noches que superé para poder continuar después de cerrar la aplicación.

El juego habilita **Continuar** al superar la Noche 1 y permite acceder a la Noche 2 después de reabrir la aplicación. Las pruebas ejecutadas y pendientes se registran en [PRUEBAS.md](PRUEBAS.md).

## 1.4 Evidencias de la Parte 1

- [Ficha de idea](IDEA.md)
- [Matriz de pruebas y capturas de la Noche 2](PRUEBAS.md)
