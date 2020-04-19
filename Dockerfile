#FROM nginx:alpine
#COPY --from=build /usr/src/app/dist/Angular-Docker-Demo02 /usr/share/nginx/html


# STAGE -2
#FROM node:latest AS builder
#COPY . .
#WORKDIR /app
#RUN npm istall
#RUN npm run build --prod

#FROM nginx:alpine
#COPY --from=builder /app/dist/Angular-Docker-Demo02/ /usr/share/nginx/html



FROM node:12-alpine as node
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
RUN npm audit fix
COPY . .
RUN npm run build


# Stage 2
FROM nginx:1.13.12-alpine
COPY --from=node /usr/src/app/dist/Angular-Docker-Demo02 /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/conf.d/default.conf