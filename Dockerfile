#FROM nginx:alpine
#COPY /dist/Angular-Docker-Demo02 /user/share/nginx/html
# UR : -


FROM node:latest AS builder
COPY . .
WORKDIR /app
RUN npm istall
RUN npm run build --prod

FROM nginx:alpine
COPY --from=builder /app/dist/Angular-Docker-Demo02/ /usr/share/nginx/html