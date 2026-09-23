---
name: Papelera Wilpel
description: Institutional home for a 40-year Wilde neighborhood papelera — the storefront as proof, not a slogan.
colors:
  navy: "#122B4C"
  navy-soft: "#2C4568"
  red: "#D44533"
  red-dark: "#B23A2A"
  red-ink: "#C23A28"
  red-ink-soft: "#FFEDE8"
  blue: "#2A67AF"
  blue-soft: "#3D7BC4"
  cream: "#F9F6F2"
  cream-line: "#E7E0D4"
  white: "#FFFFFF"
  ink: "#16233A"
  ink-soft: "#4B5C78"
typography:
  display:
    fontFamily: "Bricolage Grotesque, system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif"
    fontSize: "clamp(2.3rem, 5vw, 3.3rem)"
    fontWeight: 800
    lineHeight: 1.05
    letterSpacing: "-0.01em"
  headline:
    fontFamily: "Bricolage Grotesque, system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif"
    fontSize: "clamp(1.8rem, 3.4vw, 2.5rem)"
    fontWeight: 800
    letterSpacing: "-0.01em"
  title:
    fontFamily: "Bricolage Grotesque, system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif"
    fontSize: "1.12rem"
    fontWeight: 800
  body:
    fontFamily: "system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif"
    fontSize: "1rem"
    fontWeight: 400
    lineHeight: 1.5
  label:
    fontFamily: "Bricolage Grotesque, system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif"
    fontSize: "0.98rem"
    fontWeight: 700
rounded:
  sm: "10px"
  md: "18px"
  pill: "999px"
spacing:
  gutter: "clamp(1.25rem, 4vw, 3rem)"
  section: "clamp(3.5rem, 7vw, 5.5rem)"
  wrap: "1160px"
components:
  button-whatsapp:
    backgroundColor: "{colors.red-ink}"
    textColor: "{colors.white}"
    typography: "{typography.label}"
    rounded: "{rounded.pill}"
    padding: "0.85rem 1.5rem"
  button-whatsapp-hover:
    backgroundColor: "{colors.red-dark}"
    textColor: "{colors.white}"
  button-outline:
    backgroundColor: "transparent"
    textColor: "{colors.navy}"
    typography: "{typography.label}"
    rounded: "{rounded.pill}"
    padding: "0.85rem 1.5rem"
  button-outline-hover:
    backgroundColor: "{colors.navy}"
    textColor: "{colors.white}"
  rubro-tile-navy:
    backgroundColor: "{colors.navy}"
    textColor: "{colors.white}"
    rounded: "{rounded.md}"
    padding: "1.9rem 1.6rem"
  rubro-tile-red:
    backgroundColor: "{colors.red-ink}"
    textColor: "{colors.white}"
    rounded: "{rounded.md}"
    padding: "1.9rem 1.6rem"
  rubro-tile-blue:
    backgroundColor: "{colors.blue}"
    textColor: "{colors.white}"
    rounded: "{rounded.md}"
    padding: "1.9rem 1.6rem"
  rubro-tile-cream:
    backgroundColor: "{colors.cream}"
    textColor: "{colors.navy}"
    rounded: "{rounded.md}"
    padding: "1.9rem 1.6rem"
---

# Design System: Papelera Wilpel

## Overview

**Creative North Star: "The Storefront as Proof"**

Wilpel's home doesn't open with a generic product hero or a price-less catalog wall — it opens with the
actual storefront on Av. Belgrano and the "40 years in Wilde" claim, because the trajectory itself is the
sales argument for a neighborhood papelera with three very different buyer types (comercios, empresas,
público minorista). The palette and mark come from the brand's own Instagram, so the system reads as an
inherited identity being formalized in code, not a fresh invention: warm cream fields, a navy anchor, and a
red accent that had to be deliberately re-tuned (see Colors) once it was asked to carry white body text
rather than just sit as a brand dot. Bricolage Grotesque replaces an originally-planned Plus Jakarta
Sans/Outfit pairing after the project's own detector flagged that pairing as an overused AI-generated-UI
default — a disclosed correction, not drift.

The system is flat and warm, never sharp or corporate: soft ambient shadows (never hard offset), fully
rounded pill buttons, generously rounded tile corners, and single-stroke line icons drawn to match the
brand mark's own roll-of-tape geometry. Depth is conveyed by soft, color-tinted ambient shadows on hover,
not by borders or elevation layers stacked by default.

**Key Characteristics:**
- Photograph-led opening: the real storefront, not a stock or illustrated hero.
- One accent red, re-tuned for accessibility rather than left at its "true" brand value.
- Pill-shaped, single-accent buttons; no ghost/tertiary button variant in the built system.
- Four-color committed rubro tiles (navy / red-ink / blue / cream), not uniform white icon-cards.
- One authored entrance choreography on the hero; everywhere else the page is static.
- A four-step WhatsApp contact ladder, present at every scroll depth without ever overlapping itself.

## Colors

Warm cream ground, navy anchor, one red accent doing double duty as both brand color and interactive
call-to-action — with a second, darker "ink" variant of that same red reserved specifically for any surface
that also carries white text.

### Primary
- **Wilpel Red** (`#D44533`): the brand accent — used for the brand mark's stroke color and as a
  non-text-bearing accent. Measured at 4.47:1 against white body/button text, which fails AA for body copy,
  so it is never used as a background under white text.
- **Wilpel Red Ink** (`--red-ink`, `#C23A28`): the accessible working red — a deliberately darkened variant
  of the brand red, verified at 5.34:1 against white. This is the color actually used on every red button,
  the WhatsApp contact band, one of the four rubro tiles, and the floating WhatsApp button — anywhere red
  carries white text or an icon that needs to read clearly.

### Secondary
- **Wilde Blue** (`#2A67AF`): the aro-blue accent — used for hover underlines in navigation, the focus-ring
  color, scrollbar theming, one of the four rubro tiles, and the low-opacity location-section mark.

### Neutral
- **Navy** (`#122B4C`): the dominant ink — headings, header/footer background, primary button-outline
  color, one rubro tile.
- **Cream** (`#F9F6F2`): the warm section background — hero, WhatsApp-band-adjacent sections, and one rubro
  tile treated as a bordered neutral panel rather than a solid color block.
- **Ink** (`#16233A`) / **Ink Soft** (`#4B5C78`): body text and secondary/muted body text respectively.
- **Cream Line** (`#E7E0D4`): hairline borders — header bottom border, mobile nav divider, cream-tile
  border, rubro tag pill border.
- **White** (`#FFFFFF`): button text on filled surfaces, footer heading color.

### Named Rules
**The Red-Ink Substitution Rule.** The brand's literal Instagram red (`#D44533`) is reserved for
non-text-bearing brand accents (the mark's stroke, small decorative uses). Any surface pairing red with
white body or button text must use `--red-ink` (`#C23A28`) instead — it is the only red verified to clear
4.5:1 contrast. Do not reintroduce the raw brand red under white text to "match the logo more exactly"; that
regresses a fixed accessibility defect.

**The Committed-Panel Rule.** Rubro/category tiles are solid color blocks (navy, red-ink, blue, or
bordered cream) with `color: inherit` headings, not white card shells with a colored icon accent. A future
tiled section on this site should default to this pattern rather than a generic white card unless there's a
specific reason to break from it.

## Typography

**Display Font:** Bricolage Grotesque (self-hosted variable woff2, weight axis 200-800; only 700-800 is
used, with system-ui fallback)
**Body Font:** system-ui, -apple-system, "Segoe UI", Roboto, sans-serif (the OS-native stack; no added
weight or character beyond the system default)

**Character:** A high-personality variable display face carries every heading, the brand name, and every
button label at heavy weight (700-800), set against a completely neutral, unstyled system body face — the
pairing puts all of the brand's voice into headlines and calls-to-action, and none of it into paragraph
text. Plus Jakarta Sans and Outfit were the original candidates and were dropped after the project's
detector flagged both as overused AI-generated-UI defaults; Bricolage Grotesque was chosen for having more
character and not appearing on that list. This is a disclosed, already-implemented correction — cite
Bricolage Grotesque as the system's display face, not the superseded pairing.

### Hierarchy
- **Display** (800, `clamp(2.3rem, 5vw, 3.3rem)`, line-height ~1.05): the `<h1>`, hero-only, Wilpel's name
  and claim.
- **Headline** (800, `clamp(1.8rem, 3.4vw, 2.5rem)`): section `<h2>`s ("En qué rubros trabajamos", "Dónde
  estamos", "Escribinos por WhatsApp").
- **Title** (800, `1.12rem`): rubro tile `<h3>`s; color is inherited from the tile's own panel color, never
  the global navy heading color.
- **Body** (400, `1rem`/`1.15rem` for hero lead, line-height 1.5, up to ~56ch measure on section leads):
  paragraph copy throughout, in the system font stack.
- **Label** (700, `0.85rem`-`1.1rem` depending on button size): button and rubro-tag text, always in the
  display face at heavy weight even though it functions as a label, not a headline.

### Named Rules
**The Two-Voice Rule.** Only headings, the brand name, buttons, and short tag/label text ever use
Bricolage Grotesque. Body copy — leads, descriptions, footer text — always uses the system stack. Do not
promote body copy into the display face; that would erase the hierarchy the pairing exists to create.

## Layout

Single-column content wrapped at a `1160px` max width (`--wrap`) with a responsive side gutter
(`clamp(1.25rem, 4vw, 3rem)`). The hero is the only two-column layout in the built system: it stacks on
mobile and becomes an even 50/50 photo-left, content-right grid at `900px` and up, matching the direction
contract's committed first-viewport split. Section vertical rhythm uses one repeated scale,
`clamp(3.5rem, 7vw, 5.5rem)` padding-block, across rubros, the WhatsApp band, and the ubicación section.
The rubro grid steps from 1 column (mobile) to 2 (`640px`) to 4 (`1024px`). The header is `76px` tall,
`position: sticky`, with a translucent cream background and backdrop blur; `scroll-padding-top` matches it
so in-page anchor links don't hide under the fixed header. Mobile navigation collapses via a
`grid-template-rows: 0fr → 1fr` transition, chosen over animating `max-height` because the project's own
detector flags `max-height` transitions as layout-thrashing.

## Elevation & Depth

The system is flat at rest. Depth appears only as a response to interaction (hover) or to lift a bordered
photo out of its cream background — never as a resting card shadow, and never as a hard, offset
neobrutalist-style shadow. Every shadow is a soft, blurred, color-tinted ambient glow: red-tinted under red
buttons, navy-tinted under the hero photo, and a shadow tinted to each rubro tile's own panel color on
hover.

### Shadow Vocabulary
- **Hero photo lift** (`box-shadow: 0 24px 48px -24px rgba(18, 43, 76, 0.35)`): resting shadow under the
  storefront photograph only.
- **WhatsApp button glow** (`box-shadow: 0 8px 20px -8px rgba(194, 58, 40, 0.55)`, intensifying on hover to
  `0 12px 24px -8px rgba(194, 58, 40, 0.6)`): the filled WhatsApp CTA at every size.
- **Rubro tile hover** (per-panel tint, e.g. `0 20px 36px -18px rgba(18, 43, 76, 0.55)` for the navy tile):
  appears only on `:hover`, matching the tile's own background hue.
- **Floating WhatsApp button** (`box-shadow: 0 12px 28px -10px rgba(194, 58, 40, 0.65)`): always-on glow
  once the button is visible.

### Named Rules
**The Ambient-Only Rule.** Shadows are soft and color-tinted, never hard-edged or offset. This world does
not use neobrutalist hard shadows anywhere in the build; don't introduce one for a future component.

## Shapes

Two corner languages, both generous and soft: fully rounded pills (`border-radius: 999px`) for every
interactive button and the rubro-tag chips, and an `18px` radius (`--radius`) for larger panels — the hero
photo, the rubro tiles. A smaller `10px` radius (`--radius-sm`) is used for compact elements like the
skip-link. No sharp corners, no clipped/angled edges, and no hard borders except thin `1.5px` hairlines
(`--cream-line`) used sparingly to separate the header, mobile nav rows, and the one bordered-cream rubro
tile from its cream background.

## Components

### Buttons
- **Shape:** fully rounded pill (`border-radius: 999px`), `1.5px` transparent border reserved for the
  outline variant.
- **Primary (WhatsApp):** `--red-ink` background, white text, `0.85rem 1.5rem` padding (small: `0.55rem
  1.05rem`; big: `1.05rem 2.1rem`), always paired with the inline WhatsApp glyph from the SVG sprite.
- **Outline:** transparent background, navy text and border; fills solid navy with white text on hover.
- **Hover / Focus:** all buttons lift `translateY(-2px)` on hover with an intensified ambient shadow;
  focus-visible uses a `2.5px` blue outline with `3px` offset, consistent across the whole page (not
  button-specific).

### Cards / Containers (Rubro tiles)
- **Corner Style:** `18px` radius, matching the hero photo.
- **Background:** one of four committed colors — navy, red-ink, blue, or bordered cream — never a uniform
  white shell. See the Committed-Panel Rule under Colors.
- **Shadow Strategy:** flat at rest, per-panel-tinted ambient shadow and a `-4px` lift on hover only.
- **Internal Padding:** `1.9rem 1.6rem`.
- **Heading color:** `color: inherit` — the `<h3>` always follows its own tile's text color, never the
  global navy heading rule.

### Navigation
- **Style:** navy text on translucent cream, `600` weight, `76px`-tall sticky header with backdrop blur.
- **Hover/active:** an underline that scales in from the left (`transform: scaleX(0→1)`) in red, `0.2s`.
- **Mobile treatment:** collapses under a hamburger toggle into a full-width dropdown using
  `grid-template-rows: 0fr → 1fr` (not `max-height`), each link full-width with a hairline divider.

### WhatsApp Contact Ladder (signature component)
A deliberate, reusable four-step escalation rather than a single CTA: a small filled button in the header
(`.btn--whatsapp.btn--small`) → a full-size filled hero CTA → a dedicated red-ink "Escribinos por WhatsApp"
band with per-rubro quick-consult links (each opens `wa.me` with a rubro-specific pre-filled message) → a
site-wide circular floating button (`.fab-whatsapp`) gated by an `IntersectionObserver` on `.hero__actions`
(`js/script.js`) so it only fades in once the hero's own WhatsApp button has scrolled out of view. This
avoids a known overlap bug an earlier version had on mobile, and is confirmed as worth keeping as-is. Any
future page on this site that adds a contact path should follow this same escalating-ladder shape rather
than a single floating button alone.

### Opiniones (reseñas de Google)
Snapshot manual de datos reales (no integración en vivo con la API de Google — el sitio no tiene backend
y la API exige una cuenta de Google Cloud con facturación; ver `PRODUCT.md`). Las tarjetas de reseña son
**neutras** (blanco sobre crema, borde `--cream-line`, radio `--radius`), deliberadamente distinto de la
Committed-Panel Rule de las tiles de rubro: una cita de cliente necesita quedar legible y creíble, no
competir con un panel de color sólido. El ícono de estrella (`#icon-star`, SVG propio, nunca el carácter
Unicode "★") usa `--red-ink`, no el amarillo de Google, para mantenerse dentro de la paleta ya cerrada del
sitio. El promedio (4.5 de 5) se arma con dos filas de estrellas superpuestas — una vacía en
`--cream-line` y una llena en `--red-ink` recortada al 90% de ancho — para reflejar la media estrella real,
en vez de redondear.

## Do's and Don'ts

### Do:
- **Do** use `--red-ink` (`#C23A28`), not the raw brand red `#D44533`, on any surface that also carries
  white text — it's the only variant verified at 4.5:1+ contrast.
- **Do** keep rubro/category tiles as solid committed-color panels with inherited heading color, not white
  card shells.
- **Do** reserve Bricolage Grotesque for headings, brand name, buttons, and short labels; keep body copy in
  the system stack.
- **Do** use soft, color-tinted ambient shadows for hover/elevation states; keep the page flat at rest.
- **Do** follow the WhatsApp contact ladder shape (small header button → hero CTA → dedicated band with
  per-rubro links → gated floating button) for any future contact-oriented addition.

### Don't:
- **Don't** use Plus Jakarta Sans, Outfit, or other detector-flagged overused AI-UI faces anywhere on this
  site — this was an explicit, disclosed correction already made once.
- **Don't** introduce hard-edged or offset (neobrutalist-style) shadows; every shadow in this system is a
  soft ambient blur.
- **Don't** animate `max-height` for collapsing UI (mobile nav); use `grid-template-rows: 0fr → 1fr`
  instead, per the project's own layout-thrashing detector.
- **Don't** state shipping/payment conditions anywhere on the site until they're confirmed facts in
  PRODUCT.md — their absence is deliberate, not an omission to "fix." (Saturday hours were confirmed by the
  client after this system was first documented and now ship on the page: Sáb 8:00–13:00, corrected
  23/09/2026 — it originally shipped as 13:30 by mistake.)
