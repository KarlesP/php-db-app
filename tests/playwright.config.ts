import { defineConfig } from '@playwright/test';

export default defineConfig({
  testDir: '.',
  testMatch: ['*.test.ts'],
  use: {
    headless: true,
  },
});
