# Plan — CI/CD para Papelera Wilpel

Pedido: repo en GitHub, tests que validen la funcionalidad actual, `main` protegida (solo vía PR),
y que los PR corran los tests. Deploy a producción al mergear a `main`.

## 1. Repositorio en GitHub
- Repo **privado**: `germandt/papelera-wilpel` (default seguro para un repo de infraestructura de un
  negocio; se puede pasar a público después si se quiere).
- Se sube el commit local que ya existe. Es el único commit que entra directo a `main`, porque en ese
  momento la protección todavía no existe — es el arranque. Después de esto, nada más entra sin PR.

## 2. Tests (Playwright)
Sitio estático, sin build ni framework hoy. Se agrega lo mínimo para poder testear:
- `package.json` + `playwright.config.js` (sirve el sitio local con `http-server` durante los tests).
- `tests/site.spec.js`, corriendo en dos perfiles (desktop y mobile), cubriendo lo que ya construimos:
  - Título de la página y sin errores de consola.
  - Los 4 links del header apuntan a las secciones correctas (`#nosotros`, `#rubros`, `#ubicacion`, `#contacto`).
  - El hero muestra "Papelera Wilpel" y el texto de los 40 años; la foto del local carga.
  - Los 4 rubros están y cada uno tiene su link de "Consultar" a `wa.me/5491162701341` con el mensaje
    correcto.
  - Los botones de WhatsApp (header, hero, banda, flotante) apuntan al número correcto.
  - "Cómo llegar" apunta a Google Maps con la dirección de Av. Belgrano.
  - El horario del sábado (8:00 a 13:30) está en la página.
  - Los teléfonos del footer tienen `tel:` bien formados.
  - El botón flotante de WhatsApp aparece recién al pasar el hero (el `IntersectionObserver`).
  - El menú mobile abre y cierra correctamente.
  - No hay scroll horizontal en mobile (390px).
- Se corren localmente antes de subir nada, para no descubrir un test roto recién en GitHub Actions.

## 3. Infraestructura para el deploy automático (Terraform)
Nuevo archivo `github-oidc.tf`. En vez de guardar credenciales de AWS como secreto en GitHub (lo que
intentamos evitar toda la sesión), se usa **OIDC**: GitHub Actions le pide a AWS un rol temporal,
solo válido para pushes a `main` de este repo puntual. Ningún secreto viaja ni se guarda en ningún lado.
- `aws_iam_openid_connect_provider`: le dice a AWS que confíe en los tokens de GitHub Actions.
- `aws_iam_role` "wilpel-github-actions-deploy": el rol que asume el workflow, con una condición que
  solo lo permite desde `repo:germandt/papelera-wilpel:ref:refs/heads/main` (ni siquiera otras ramas
  o forks pueden pedirlo).
- Permisos del rol, acotados (no `PowerUserAccess`): subir/borrar objetos solo en el bucket del sitio,
  e invalidar caché solo de esta distribución de CloudFront. Nada más.
- **Este paso se muestra con `terraform plan` antes de aplicar**, como el resto de la sesión.

## 4. Workflows de GitHub Actions
- **`.github/workflows/test.yml`**: corre en cada Pull Request contra `main`. Instala dependencias,
  corre los tests de Playwright. Este es el check que después va a ser obligatorio para poder mergear.
- **`.github/workflows/deploy.yml`**: corre en cada push a `main` (o sea, cada vez que se mergea un PR).
  Asume el rol de AWS por OIDC, sube los archivos (`index.html`, `css/`, `js/`, `assets/`) al bucket,
  invalida la caché de CloudFront, y verifica con un `curl` que el sitio responda bien después.

## 5. Protección de la rama `main`
Con los workflows ya en el repo, se configura la rama:
- Nada se puede pushear directo a `main`: todo entra por Pull Request.
- El PR no se puede mergear si el check `test` no pasó.
- La restricción aplica también para el dueño del repo (sin atajos), tal como se pidió.

## Orden de ejecución
1. Escribir tests + workflows + Terraform (en paralelo, son independientes entre sí).
2. `npm install` y correr los tests localmente contra el sitio ya construido, para confirmar que pasan.
3. `terraform plan` del rol de OIDC → mostrar → aplicar con aprobación.
4. Crear el repo en GitHub (privado) y pushear el commit inicial a `main` (el único directo).
5. Cargar en el repo las variables que necesita `deploy.yml` (bucket, distribution id, rol de AWS) —
   son datos, no secretos, así que van como "repository variables", no como "secrets".
6. Confirmar que el workflow de test corrió bien en ese push.
7. Activar la protección de `main`.
8. Devolver un resumen: URLs, cómo se ve el flujo de acá en adelante (rama → PR → tests → merge → deploy).

## Qué no incluye este plan (a menos que se pida)
- No se agrega un requisito de "1 aprobación humana" en el PR — sos el único que trabaja en esto, así
  que alcanza con que los tests pasen. Se puede sumar después si el equipo crece.
- No se toca nada de lo ya desplegado (S3, CloudFront, Route53, Budget): este plan solo agrega el
  mecanismo de despliegue automático hacia esos mismos recursos.
