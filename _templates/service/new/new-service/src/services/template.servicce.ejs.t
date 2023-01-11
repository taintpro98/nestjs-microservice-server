---
to: apps/<%=name%>-service/src/services/<%=name%>.service.ts
---
import { Injectable, Inject } from '@nestjs/common';
import { REPOSITORIES } from '@accel3-platform/<%=name%>-service/constants';
import { I<%= h.changeCase.pascalCase(name) %>Repository } from '@accel3-platform/<%=name%>-service/repositories/interfaces/<%=name%>.interface';
import { <%= h.changeCase.pascalCase(name) %>Transformer } from '@accel3-platform/<%=name%>-service/transformers';
import { <%= h.changeCase.pascalCase(name) %>Filter } from '@accel3-platform/<%=name%>-service/filters';
import { getRelationsFromIncludes } from '@accel3-platform/shared/utils';

@Injectable()
export class <%= h.changeCase.pascalCase(name) %>Service {
  constructor(
    @Inject(REPOSITORIES.<%= h.changeCase.constantCase(name) %>_REPOSITORY)
    private readonly <%= h.changeCase.camelCase(name) %>Repository: I<%= h.changeCase.pascalCase(name) %>Repository,
    private readonly <%= h.changeCase.camelCase(name) %>Transformer: <%= h.changeCase.pascalCase(name) %>Transformer
  ) {}

  async list(
    filters?: <%= h.changeCase.pascalCase(name) %>Filter,
    include = ''
  ): Promise<any> {
    let <%= h.changeCase.camelCase(name) %>: any = await this.<%= h.changeCase.camelCase(name) %>Repository.list(filters);
    const relations = getRelationsFromIncludes(include);
    <%= h.changeCase.camelCase(name) %> = await this.<%= h.changeCase.camelCase(name) %>Repository.with(<%= h.changeCase.camelCase(name) %>, relations);
    return await this.<%= h.changeCase.camelCase(name) %>Transformer.collection(<%= h.changeCase.camelCase(name) %>, { include });
  }
}