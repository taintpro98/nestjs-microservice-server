---
to: apps/<%=name%>-service/src/filters/<%=name%>.filters.ts
---
export declare type <%= h.changeCase.pascalCase(name) %>Filter = {
  ids?: (string | number)[];
};