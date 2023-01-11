---
to: apps/<%=name%>-service/src/<%=name%>.module.ts
---
import { Module } from '@nestjs/common';
import { <%= h.changeCase.pascalCase(name) %>Controller } from '@accel3-platform/<%=name%>-service/controllers';
import { <%= h.changeCase.pascalCase(name) %>Service } from '@accel3-platform/<%=name%>-service/services';
import { ConfigModule } from '@nestjs/config';
import { REPOSITORIES } from '@accel3-platform/<%=name%>-service/constants';
import { <%= h.changeCase.pascalCase(name) %>Repository } from '@accel3-platform/<%=name%>-service/repositories';
import {configDb} from '@accel3-platform/<%=name%>-service/configs/database';
import * as Transformer from '@accel3-platform/<%=name%>-service/transformers';

const transformers = [
  Transformer.<%= h.changeCase.pascalCase(name) %>Transformer
];

const repositories = [
  {
    provide: REPOSITORIES.<%= h.changeCase.constantCase(name) %>_REPOSITORY,
    useClass: <%= h.changeCase.pascalCase(name) %>Repository,
  },
];
@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      expandVariables: true,
      load: [configDb],
    }),
  ],
  controllers: [<%= h.changeCase.pascalCase(name) %>Controller],
  providers: [<%= h.changeCase.pascalCase(name) %>Service, ...transformers, ...repositories],
})
export class <%= h.changeCase.pascalCase(name) %>Module {}