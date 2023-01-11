---
to: apps/<%=name%>-service/src/models/<%=name%>.model.ts
---
import { db, softDelete } from '@accel3-platform/<%=name%>-service/configs/database';
import { BaseModel } from '@accel3-platform/shared/models';
import { v4 as uuidv4 } from 'uuid';
import { Model } from 'objection';

class <%= h.changeCase.pascalCase(name) %> extends softDelete(BaseModel) {
  static tableName = '<%= h.changeCase.snakeCase(name) %>'
  id!: string;
  created_at?: Date | null;
  updated_at?: Date | null;
  deleted_at?: Date | null;
  $beforeInsert() {
    this.id = uuidv4();
    this.created_at = new Date();
    this.updated_at = new Date();
  }

  $beforeUpdate() {
    this.updated_at = new Date();
  }

  static jsonSchema = {
    type: 'object',

    properties: {
      id: { type: 'string' },
      created_at: { type: ['string', 'null'], format: 'date-time' },
      updated_at: { type: ['string', 'null'], format: 'date-time' },
      deleted_at: { type: ['string', 'null'], format: 'date-time' },
    },
  };
}

const <%= h.changeCase.pascalCase(name) %>Model = <%= h.changeCase.pascalCase(name) %>.bindKnex(db);

export default <%= h.changeCase.pascalCase(name) %>Model;

<%= h.changeCase.pascalCase(name) %>Model.relationMappings = {};
