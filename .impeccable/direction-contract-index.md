## Surface

index.html — home institucional de Papelera Wilpel.

## Scope and visitor mode

Persuade. Un visitante nuevo (comercio, empresa o minorista) debe confiar en Wilpel en segundos y contactarla
por WhatsApp, teléfono o visitando el local. Sin carrito, sin precios, sin backend.

## Audience, job, action, proof, constraints

Ver `design/brief-home.md` puntos 1-2 y 4-7 (público, resultado, alcance y decisiones abiertas).

## Direction contract

**THESIS:** la trayectoria en el barrio es la prueba, no un eslogan. En vez de abrir con un hero genérico de
producto, la home abre con el local real y los 40 años, y recién después llegan los rubros. Se rechaza el
hero-metric genérico y la vidriera de productos sin contexto que usan la mayoría de las papeleras online.

**OWN-WORLD:** paleta Wilpel — azul marino `#122B4C` (texto, header, footer), rojo `#D44533` (acento, CTA,
ícono del rollo), azul del aro `#2A67AF` (franjas, hover), crema `#F9F6F2` (fondo cálido de secciones claras),
blanco. Tipografía: Bricolage Grotesque (self-hosted, variable 200-800) para títulos, marca y botones —
Plus Jakarta Sans y Outfit quedaron descartadas por el detector mecánico de la skill, que las marca como
fuentes sobreusadas en interfaces generadas por IA; Bricolage Grotesque tiene más carácter y no está en esa
lista. Cuerpo de texto en pila del sistema (sans neutra, sin peso agregado). Tiles con ícono plano de trazo
único en el estilo del rollo del logo. Sin gradientes ni sombras duras; profundidad con sombra suave y offset.

**STORY:** el visitante ve el local real y entiende "esto existe, tiene 40 años, está en Wilde". Confirma qué
rubros trabaja Wilpel. Ve el botón de WhatsApp y lo usa, o baja a ver ubicación y horarios si prefiere ir en
persona.

**FIRST VIEWPORT:** dos columnas a partir de escritorio. Izquierda (50%): foto del frente del local
(`design/assets/local-fachada-instagram.png`), a sangre, con leve viñeta inferior para asegurar contraste si
se superpone texto. Derecha (50%): arriba el claim ("Papelera Wilpel" + "Más de 40 años en Wilde") con la
trayectoria en una línea de apoyo; en el medio, la lista de rubros en una sola línea de texto (no tiles, eso
va más abajo); abajo, dos botones: WhatsApp (relleno rojo) y "Cómo llegar" (contorno). El header con
logo + menú + botón WhatsApp queda fijo arriba de esta composición, no la reduce.

**FORM:** "Wilde, 40 años", opción `alt-wilde40` del sorteo de superficie, posición 6 de 7 en la lista de
estructuras ordenada por resonancia. Seed key `ab522786`.

**FINISH:** unreviewed and undocumented is unfinished; this build ends with the finish review, the verdict,
DESIGN.md, and every shipping raster carrying its provenance.
