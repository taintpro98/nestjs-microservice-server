---
to: apps/<%=name%>-service/src/environments/environment.prod.ts
---
export const environment = {
  production: true,
  pathSeeds: './assets/seeders/production',
  pathMigrations: './assets/migrations/production',
};