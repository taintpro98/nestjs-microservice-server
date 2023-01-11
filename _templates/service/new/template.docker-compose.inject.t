---
inject: true
to: docker-compose.yml
after: services
---
  <%=name%>-service:
    image: accel3-platform-<%=name%>-service:1.0.0
    container_name: accel3-platform-<%=name%>-service
    env_file:
      - .env.global.dev
      - apps/<%=name%>-service/.env.dev
    environment:
      APP_ENV: dev
    networks:
      - accel3-platform-network
      