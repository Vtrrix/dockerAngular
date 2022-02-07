FROM node:12.14.1-alpine as builder
WORKDIR /angularDocker
COPY . .
RUN npm i
RUN npm run build --prod

FROM nginx:1.15.8-alpine
COPY --from=builder /angularDocker/dist/angularDocker/ usr/share/nginx/html