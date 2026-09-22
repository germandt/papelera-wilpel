// @ts-check
const { test, expect } = require('@playwright/test');

test.describe('Home de Wilpel', () => {
  test('carga con el título correcto', async ({ page }) => {
    await page.goto('/');
    await expect(page).toHaveTitle(/Wilpel Papelera/);
  });

  test('no tira errores de consola', async ({ page }) => {
    const errors = [];
    page.on('pageerror', (e) => errors.push(e.message));
    page.on('console', (msg) => {
      if (msg.type() === 'error') errors.push(msg.text());
    });
    await page.goto('/');
    await page.waitForLoadState('networkidle');
    expect(errors).toEqual([]);
  });

  test('el header tiene los 4 links de navegación', async ({ page }) => {
    await page.goto('/');
    const nav = page.locator('#site-nav');
    await expect(nav.getByRole('link', { name: 'Nosotros' })).toHaveAttribute('href', '#nosotros');
    await expect(nav.getByRole('link', { name: 'Rubros' })).toHaveAttribute('href', '#rubros');
    await expect(nav.getByRole('link', { name: 'Ubicación' })).toHaveAttribute('href', '#ubicacion');
    await expect(nav.getByRole('link', { name: 'Contacto' })).toHaveAttribute('href', '#contacto');
  });

  test('las secciones ancladas existen', async ({ page }) => {
    await page.goto('/');
    for (const id of ['nosotros', 'rubros', 'contacto', 'ubicacion']) {
      await expect(page.locator(`#${id}`)).toHaveCount(1);
    }
  });

  test('el hero muestra el claim y los 40 años', async ({ page }) => {
    await page.goto('/');
    await expect(page.locator('h1')).toHaveText('Papelera Wilpel');
    await expect(page.locator('.hero__lead')).toContainText('40 años');
  });

  test('la foto del local carga', async ({ page }) => {
    await page.goto('/');
    const img = page.locator('.hero__photo img');
    await expect(img).toBeVisible();
    const naturalWidth = await img.evaluate((el) => el.naturalWidth);
    expect(naturalWidth).toBeGreaterThan(0);
  });

  test('los 4 rubros están presentes, cada uno con su link de WhatsApp', async ({ page }) => {
    await page.goto('/');
    const rubros = ['Insumos de embalaje', 'Cajas', 'Vajillas y descartables', 'Bandejas y potes'];
    for (const nombre of rubros) {
      const tile = page.locator('.rubro', { hasText: nombre });
      await expect(tile).toHaveCount(1);
      const link = tile.getByRole('link', { name: /Consultar/ });
      await expect(link).toHaveAttribute('href', /^https:\/\/wa\.me\/5491162701341\?text=/);
    }
  });

  test('todos los botones de WhatsApp apuntan al número correcto', async ({ page }) => {
    await page.goto('/');
    const whatsappButtons = page.locator('a.btn--whatsapp');
    const count = await whatsappButtons.count();
    expect(count).toBeGreaterThan(0);
    for (let i = 0; i < count; i++) {
      await expect(whatsappButtons.nth(i)).toHaveAttribute('href', /^https:\/\/wa\.me\/5491162701341/);
    }
  });

  test('"Cómo llegar" apunta a Google Maps con la dirección correcta', async ({ page }) => {
    await page.goto('/');
    const link = page.getByRole('link', { name: 'Cómo llegar' }).first();
    await expect(link).toHaveAttribute('href', /google\.com\/maps\/search/);
    await expect(link).toHaveAttribute('href', /Belgrano/);
  });

  test('el horario del sábado está confirmado', async ({ page }) => {
    await page.goto('/');
    await expect(page.locator('#ubicacion')).toContainText('8:00 a 13:30');
  });

  test('el footer tiene los teléfonos con enlaces tel: válidos', async ({ page }) => {
    await page.goto('/');
    const footer = page.locator('.site-footer');
    await expect(footer.getByRole('link', { name: '4206-9662' })).toHaveAttribute('href', 'tel:+541142069662');
    await expect(footer.getByRole('link', { name: '4206-9747' })).toHaveAttribute('href', 'tel:+541142069747');
  });

  test('el botón flotante de WhatsApp aparece recién al pasar el hero', async ({ page }) => {
    await page.goto('/');
    const fab = page.locator('.fab-whatsapp');
    await expect(fab).not.toHaveClass(/is-visible/);
    await page.locator('#rubros').scrollIntoViewIfNeeded();
    await expect(fab).toHaveClass(/is-visible/);
  });

  test('el menú mobile abre y cierra', async ({ page, isMobile }) => {
    test.skip(!isMobile, 'Solo aplica en el viewport mobile');
    await page.goto('/');
    const toggle = page.locator('#nav-toggle');
    const nav = page.locator('#site-nav');
    await expect(toggle).toHaveAttribute('aria-expanded', 'false');
    await toggle.click();
    await expect(toggle).toHaveAttribute('aria-expanded', 'true');
    await expect(nav).toHaveClass(/is-open/);
    await toggle.click();
    await expect(toggle).toHaveAttribute('aria-expanded', 'false');
  });

  test('sin scroll horizontal en mobile', async ({ page, isMobile }) => {
    test.skip(!isMobile, 'Chequeo específico de mobile');
    await page.goto('/');
    const hasOverflow = await page.evaluate(
      () => document.documentElement.scrollWidth > document.documentElement.clientWidth + 1
    );
    expect(hasOverflow).toBe(false);
  });
});
