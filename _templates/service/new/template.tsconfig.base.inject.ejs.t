---
inject: true
to: tsconfig.base.json
after: paths
prepend: true
---
      "@accel3-platform/<%=name%>-service/*": ["apps/<%=name%>-service/src/*"],