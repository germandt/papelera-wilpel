# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Stack

HTML/CSS/JS plano, sin build ni dependencias (elegido por el usuario).
Destino previsto: sitio estático en AWS (S3 + CloudFront) definido con Terraform, en una cuenta gratuita de AWS.

## Users

Tres públicos, sin jerarquía entre ellos:
- Comercios y gastronomía: dueños o encargados que reponen insumos (cajas, vasos, bolsas, film).
- Empresas e industrias: compras recurrentes o por volumen.
- Público minorista: personas que compran cantidades chicas.

Su trabajo en la página: confirmar que Wilpel es una papelera real y cercana, ver qué rubros trabaja, y
saber cómo contactarla o ir al local. La página no es el lugar donde compran.

## Product Purpose

Sitio institucional de Papelera Wilpel (Wilde, Buenos Aires): quiénes son, qué rubros trabajan,
dónde están, en qué horario atienden y cómo contactarlos. Incluye un espacio destacado para
iniciar una conversación por WhatsApp. Éxito: que un visitante nuevo confíe en la empresa y la contacte
o la visite. No hay carrito, precios publicados ni pago online.

## Positioning

Papelera de barrio con más de 40 años de trayectoria y local propio en Wilde, que vende por mayor y por menor,
con rubros variados y envíos a domicilio.

## Operating Context

- Venta por mayor y por menor.
- Atención en el local de Av. Belgrano 6085, Wilde (1875), Buenos Aires. La ficha de Google Maps del
  negocio dice "Av. Manuel Belgrano 6042" — el cliente confirmó que 6085 es la dirección correcta
  (22/09/2026); la ficha de Google está desactualizada y queda pendiente que el cliente la corrija ahí
  (fuera del alcance de este sitio).
- Horario: Lun-Vie 8:00 a 13:00 y 14:30 a 17:30. Sábados 8:00 a 13:30.
- Contacto: teléfonos 4206-9662 y 4206-9747; WhatsApp 11 6270-1341 (`https://wa.me/5491162701341`).
- Instagram: @wilpelpapel. Sus historias destacadas ya ordenan la información: Nosotros, Horarios, Contacto, Pagos, Envíos, Ubicación.
- Rubros vistos en el Instagram: embalaje (stretch, pluribol, cintas), cajas para gastronomía, descartables,
  papel higiénico y rollos de cocina.

## Capabilities and Constraints

- Idioma: español de Argentina.
- Sin backend: el contacto es por enlaces (WhatsApp, teléfono, mapa).
- Sin catálogo con precios ni carrito.
- Tono de trato: vos (confirmado).
- Dominio: wilpel.com.ar (confirmado por el cliente; falta verificar dónde está registrado y su DNS).
- Sin definir todavía: zonas y condiciones de envío, medios de pago.
- Nombre de la empresa: Wilpel, con la p minúscula.

## Brand Commitments

- Logo, tipografía y colores se toman del Instagram @wilpelpapel; el usuario lo pidió así.
  Lo relevado está en `design/brand-notes.md`.
- No existe el logo original. El logo de los posts escribe "WilPel" con P mayúscula, que es incorrecto.
  Hay que rehacer el wordmark como "Wilpel" antes de publicarlo.
- El usuario indicó como referencia de estructura a flexipack.com.ar (header, footer y los íconos de categorías).
  Es una referencia de estructura, no de marca ni de contenido.

## Evidence on Hand

- `design/brand-notes.md`: datos del negocio, paleta medida y notas de tipografía.
- `design/assets/`: capturas del logo y de un post del Instagram (baja resolución, solo referencia).
- El usuario indicó que existen fotos propias de productos y una lista de categorías, pero todavía no se recibieron.
  Mientras tanto, solo hay lo publicado en el Instagram.
- Reseñas reales relevadas el 22/09/2026 desde la ficha de Google Maps del negocio ("Papelera Wilpel"):
  calificación 4.5 sobre 472 reseñas, y 3 reseñas con nombre y 5 estrellas cada una (Ricardo Omar Varela,
  Matias Lopez, Julio Lazarte). Usadas tal cual en la sección "Opiniones" — no son inventadas.
  La ficha de Google dice la dirección "Av. Manuel Belgrano 6042"; el cliente confirmó que "6085" (la que
  ya usa el sitio) es la correcta — ver Operating Context.
- No existen: logo vectorial, lista de clientes más allá de las 3 reseñas citadas, precios, condiciones de
  envío ni medios de pago confirmados. No hay que inventarlos.
- La foto del hero (`assets/img/local-fachada-render.jpg`) es una imagen generada por IA del frente del
  local, no una fotografía real — reemplaza a la foto real usada antes (tomada del Instagram). El cliente
  pidió explícitamente este reemplazo (22/09/2026) sabiendo que no es una foto auténtica.

## Product Principles

1. Presencia y contacto antes que catálogo: la página se ordena para que alguien confíe y llame o escriba.
2. El camino a Wilpel (WhatsApp, teléfono, local) siempre está a la vista.
3. Un solo sitio para tres públicos, sin obligar al visitante a elegir cuál es.
4. Solo se afirma lo verificado: años de trayectoria, envíos y pagos hasta que estén confirmados.

## Ideas a futuro (fuera de alcance de v1)

- **Módulo de productos de MercadoLibre**: si el cliente publica productos ahí, se podría exponer un
  catálogo en la home (o linkear directamente a su local de ML). Implica mostrar precios, lo cual hoy
  contradice el principio "Sin catálogo con precios ni carrito" — sería una decisión de producto para v2,
  no solo técnica. Opciones evaluadas: (a) simple botón/link al local de ML (menor esfuerzo), (b) snapshot
  estático de productos igual que se hizo con las reseñas de Google en Opiniones, (c) integración en vivo
  contra la API pública de MercadoLibre (`api.mercadolibre.com/sites/MLA/search?seller_id=...`), que
  requeriría confirmar soporte de CORS o sumar una función serverless chica, ya que el sitio no tiene
  backend propio.
