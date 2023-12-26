FROM node:alpine as build

WORKDIR /home/app
COPY . .

RUN npm install
RUN npm run build

FROM nginx
COPY --from=build /home/app/build /usr/share/nginx/html

EXPOSE 80


