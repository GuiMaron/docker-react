
#   BUILD
FROM node:14-alpine AS builder

WORKDIR /usr/app

COPY ./package.json ./
RUN npm install

COPY ./ ./

RUN npm run build



#   PRODUCTION
FROM nginx

COPY --from=builder /usr/app/build/ /usr/share/nginx/html

WORKDIR /usr/share/nginx/html

EXPOSE 80
