---
to: apps/<%=name%>-service/src/transformers/<%=name%>.transformer.ts
---
import { <%= h.changeCase.pascalCase(name) %>Model } from '@accel3-platform/<%=name%>-service/models';
import { Transformer } from '@accel3-platform/shared/transformers';
import { Transformer$IncludeMethodOptions } from '@accel3-platform/shared/interfaces';
import { Injectable } from '@nestjs/common';

@Injectable()
export class <%= h.changeCase.pascalCase(name) %>Transformer extends Transformer<typeof <%= h.changeCase.pascalCase(name) %>Model> {
  availableIncludes = [];
  defaultIncludes = [];

  constructor() {
    super();
  }

  async transform(
    model: typeof <%= h.changeCase.pascalCase(name) %>Model
  ): Promise<Record<string, any> | null> {
    return {
      id: (model as unknown as typeof <%= h.changeCase.pascalCase(name) %>Model['prototype'])
        .id,
    };
  }

  async includeDetail(
    model: typeof <%= h.changeCase.pascalCase(name) %>Model,
    options: Transformer$IncludeMethodOptions
  ) {
    return {
      created_at: (model as unknown as typeof <%= h.changeCase.pascalCase(name) %>Model['prototype'])
        .created_at,
    };
  }
}