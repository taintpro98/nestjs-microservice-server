---
to: apps/<%=name%>-service/src/configs/database.ts
---
import { registerAs } from '@nestjs/config';
import { DatabaseOptions } from '@squareboat/nestjs-objection';
import Knex, { Knex as K } from 'knex';
import objectionSoftDelete from 'objection-js-soft-delete';
import path from 'path';
import KnexLogger from './knex-logging';
import { environment } from '@accel3-platform/<%=name%>-service/environments/environment';

if (!process.env.DB_HOST) {
  require('dotenv').config({ path: path.resolve(__dirname, '../../.env') });
}

const config: { [key: string]: K.Config } = {
  production: {
    client: 'postgresql',
    connection: {
      host: process.env.DB_HOST,
      port: Number(process.env.DB_PORT),
      database: process.env.DB_DATABASE,
      user: process.env.DB_USERNAME,
      password: process.env.DB_PASSWORD,
    },
    pool: {
      min: 2,
      max: 10,
    },
    migrations: {
      tableName: 'migrations',
      extension: 'ts',
      directory: environment.pathMigrations,
    },
    seeds: {
      extension: 'ts',
      directory: environment.pathSeeds,
    },
  },
};

const configDb = registerAs(
  'db',
  () =>
    ({
      isGlobal: true,
      default: 'production',
      connections: config,
    } as DatabaseOptions)
);

// const db = Knex(config.production);

const db =
  process.env.APP_ENV !== 'production'
    ? KnexLogger(Knex(config.production))
    : Knex(config.production);

export async function checkDatabaseConnection() {
  try {
    await db.raw('select 1+1 as result');
    console.log(
      'Connection has been established successfully.  (battle database)'
    );
  } catch (error) {
    console.error('Unable to connect to the database', error);
  }
}

// Specify the options for this plugin. This are the defaults.
const softDelete = objectionSoftDelete({
  columnName: 'deleted_at',
  deletedValue: new Date(),
  notDeletedValue: null,
});

export { db, softDelete, configDb };

export default config;
