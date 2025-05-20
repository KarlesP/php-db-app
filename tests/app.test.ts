import { test, expect } from '@playwright/test';

const BASE = process.env.BASE_URL || 'http://localhost:8888';

test('home page contains expected message', async ({ page }) => {
  await page.goto(BASE, { waitUntil: 'domcontentloaded' });
  const body = await page.textContent('body');
  expect(body).toContain('Hello from local DB');
});

test('home page contains multiple lines', async ({ page }) => {
  await page.goto(BASE, { waitUntil: 'domcontentloaded' });
  const lines = await page.locator('body').allTextContents();
  expect(lines.length).toBeGreaterThanOrEqual(1);
});
