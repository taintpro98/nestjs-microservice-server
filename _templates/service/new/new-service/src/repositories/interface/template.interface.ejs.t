---
to: apps/<%=name%>-service/src/repositories/interfaces/<%=name%>.interface.ts
---
import { <%= h.changeCase.pascalCase(name) %>Model } from '@accel3-platform/<%=name%>-service/models';
import { IRepository } from '@accel3-platform/shared/repositories';
import { <%= h.changeCase.pascalCase(name) %>Filter } from '@accel3-platform/<%=name%>-service/filters';
import { OrderByDirection } from 'objection';

export interface I<%= h.changeCase.pascalCase(name) %>Repository extends IRepository<typeof <%= h.changeCase.pascalCase(name) %>Model> {
  list(
    filter?: <%= h.changeCase.pascalCase(name) %>Filter,
    orderBy?: string,
    sortBy?: OrderByDirection
  ): Promise<typeof <%= h.changeCase.pascalCase(name) %>Model['prototype'][]>;
}