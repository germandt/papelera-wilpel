// @ts-check
const { defineConfig, devices } = require('@playwright/test');

module.exports = defineConfig({
  testDir: './tests',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  reporter: 'list',
  use: {
    baseURL: 'http://127.0.0.1:8843',
    trace: 'on-first-retry',
  },
  webServer: {
    command: 'npx http-server . -p 8843 -c-1 --silent',
    url: 'http://127.0.0.1:8843/index.html',
    reuseExistingServer: !process.env.CI,
    timeout: 30_000,
  },
  projects: [
    { name: 'desktop', use: { ...devices['Desktop Chrome'], viewport: { width: 1440, height: 900 } } },
    // Pixel 7 (Chromium) en vez de un iPhone (WebKit), para no depender de instalar otro motor
    // de navegador además de Chromium, ni en local ni en CI.
    { name: 'mobile', use: { ...devices['Pixel 7'] } },
  ],
});
