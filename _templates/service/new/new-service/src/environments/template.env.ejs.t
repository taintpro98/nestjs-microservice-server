---
to: apps/<%=name%>-service/src/environments/environment.ts
---
export const environment = {
  production: false,
  pathSeeds: '../assets/seeders/production',
  pathMigrations: '../assets/migrations/production',
};