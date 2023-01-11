---
to: apps/<%=name%>-service/src/controllers/<%=name%>.controller.ts
---
import { <%= h.changeCase.pascalCase(name) %>Service } from '@accel3-platform/<%=name%>-service/services';
import { MessagePattern } from '@nestjs/microservices';
import { <%= h.changeCase.pascalCase(name) %>Filter } from '@accel3-platform/<%=name%>-service/filters';
import { Controller } from '@nestjs/common';

@Controller('<%=name%>')
export class <%= h.changeCase.pascalCase(name) %>Controller {
  constructor(private readonly <%= h.changeCase.camelCase(name) %>Service: <%= h.changeCase.pascalCase(name) %>Service) {}

  @MessagePattern('get_all')
  getData(filters?: <%= h.changeCase.pascalCase(name) %>Filter): Promise<any> {
    return this.<%= h.changeCase.camelCase(name) %>Service.list(filters);
  }
}