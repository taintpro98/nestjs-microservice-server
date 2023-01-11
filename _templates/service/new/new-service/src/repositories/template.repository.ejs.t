---
to: apps/<%=name%>-service/src/repositories/<%=name%>.repository.ts
---
import { Injectable } from '@nestjs/common';
import { Repository } from '@accel3-platform/shared/repositories';
import { <%= h.changeCase.pascalCase(name) %>Model } from '@accel3-platform/<%=name%>-service/models';
import { I<%= h.changeCase.pascalCase(name) %>Repository } from './interfaces';
import { AnyQueryBuilder, OrderByDirection } from 'objection';
import { <%= h.changeCase.pascalCase(name) %>Filter } from '@accel3-platform/<%=name%>-service/filters';

@Injectable()
export class <%= h.changeCase.pascalCase(name) %>Repository
  extends Repository<typeof <%= h.changeCase.pascalCase(name) %>Model>
  implements I<%= h.changeCase.pascalCase(name) %>Repository
{
  initializeModel(): typeof <%= h.changeCase.pascalCase(name) %>Model {
    return <%= h.changeCase.pascalCase(name) %>Model;
  }

  static queryFilter(
    query: AnyQueryBuilder,
    filter: <%= h.changeCase.pascalCase(name) %>Filter
  ): AnyQueryBuilder {
    if (filter?.ids) {
      query = query.whereIn(`${<%= h.changeCase.pascalCase(name) %>Model.tableName}.id`, filter?.ids);
    }
    if (filter?.ids) {
      query = query.whereIn(`${<%= h.changeCase.pascalCase(name) %>Model.tableName}.id`, filter?.ids);
    }
    return query;
  }

  async list(
    filter?: <%= h.changeCase.pascalCase(name) %>Filter,
    orderBy: string = 'id',
    sortBy: OrderByDirection = 'ASC'
  ): Promise<typeof <%= h.changeCase.pascalCase(name) %>Model['prototype'][]> {
    let query: AnyQueryBuilder = this.model.query();
    query = <%= h.changeCase.pascalCase(name) %>Repository.queryFilter(query, filter).orderBy(
      orderBy,
      sortBy
    );
    return query;
  }
}
