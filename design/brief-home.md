# Brief — Home de Wilpel

Salida de `/impeccable shape home`. Dirección elegida: **Wilde, 40 años** (seed `ab522786`, opción `alt-wilde40`,
sorteo de estructuras en modo Persuade). No es código ni un contrato de build: es el brief para construir.

## 1. Tarea y público

Tres públicos sin jerarquía entre ellos: comercios y gastronomía, empresas e industrias, y público minorista.
Llegan sin conocer a Wilpel y tienen que confiar en que es una papelera real, con local y trayectoria, y saber
cómo contactarla. No vienen a comprar en la página: no hay carrito ni precios publicados.

## 2. Resultado y prueba

Acción principal: escribir por WhatsApp (o llamar, o ir al local). Éxito: que un visitante nuevo decida contactar
o visitar Wilpel. Prueba real disponible: más de 40 años de trayectoria, local propio en Wilde, variedad de rubros,
envíos a domicilio (los cuatro confirmados por el cliente). No hay testimonios, clientes ni precios: no se inventan.

## 3. Dirección elegida

**Tesis:** la trayectoria en el barrio es la prueba. El local y los 40 años encabezan la página; los rubros acompañan.

**Mundo propio:** paleta Wilpel (`#122B4C` azul marino, `#D44533` rojo, `#2A67AF` azul del aro, `#F9F6F2` crema,
blanco), lenguaje de papelera de barrio (papel kraft, impresión offset, iconografía plana), estructura de
header/footer/tiles inspirada en flexipack.com.ar.

**Primer viewport:** foto del frente del local a la izquierda (mitad del ancho); a la derecha, arriba, el claim
con los 40 años de trayectoria y los rubros; debajo, el botón de WhatsApp y "cómo llegar".

**Imagen del hero:** `design/assets/local-fachada-instagram.png` (foto real del frente, tomada del Instagram,
baja resolución). Placeholder hasta que lleguen las fotos propias que mencionó el cliente; se reemplaza sin tocar
el layout.

## 4. Alcance y límites

Una sola página (`index.html`), navegación por anclas desde el header. Secciones, en orden:

1. Header: logo Wilpel + menú (Rubros, Nosotros, Ubicación, Contacto) + botón WhatsApp.
2. Hero "Wilde, 40 años": foto del local + claim + trayectoria + rubros + CTA.
3. Franja de confianza: envíos a domicilio · por mayor y por menor.
4. Rubros: 4 tiles con ícono (Insumos de embalaje, Cajas, Vajillas y descartables, Bandejas y potes).
5. Banda "Escribinos por WhatsApp": un botón de consulta rápida por rubro, cada uno abre WhatsApp con el
   mensaje precargado, más un botón general.
6. Ubicación: dirección, mapa, horarios.
7. Footer: sucursal, horarios, contacto, redes.

Botón de WhatsApp flotante en toda la página (`https://wa.me/5491162701341`).

Queda afuera: carrito, precios, pagos online, formularios propios, cualquier backend.

## 5. Estados y rangos

- 4 tiles de rubro (ajustables cuando llegue la lista real de categorías).
- 4 botones de consulta rápida por WhatsApp (uno por rubro) + 1 general.
- Envíos y medios de pago: sin confirmar. Se muestran solo los datos confirmados; no se inventan condiciones.
- Responsive: escritorio y celular son los dos estados que importan. Sin estados de carga ni error:
  sitio estático sin formularios propios.

## 6. Interacción y layout

Orden de lectura: local + trayectoria primero, rubros después, CTA de WhatsApp, ubicación y footer al final.
El botón flotante de WhatsApp persiste en todo el scroll. El menú del header hace scroll suave a cada sección.
Tiles y botones de WhatsApp con retroalimentación al pasar el mouse o tocar. Sin animaciones complejas ni
frameworks: HTML/CSS con JS mínimo para el botón flotante y el scroll suave.

## 7. Restricciones y decisiones abiertas

- Plataforma: web. Stack: HTML/CSS/JS plano. Destino: S3 + CloudFront vía Terraform (fase posterior, no de este brief).
- Tono: vos (confirmado).
- Idioma: español de Argentina.
- Accesibilidad: HTML semántico, alt en imágenes, contraste según la paleta.
- Decisiones que el que construye no debe inventar: zonas y condiciones de envío, medios de pago.
- Dominio: wilpel.com.ar (confirmado).
- El wordmark debe decir "Wilpel" (sin P mayúscula). Los posts del Instagram lo escriben mal;
  se corrige al maquetar el header y el footer.
- Foto real del local: usar `local-fachada-instagram.png` hasta que lleguen las fotos propias.
