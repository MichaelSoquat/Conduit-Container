FROM node:18 AS angularbuild

WORKDIR /app
COPY . $WORKDIR
RUN npm install -g @angular/cli
RUN ng build

FROM nginx:alpine
COPY --from=angularbuild /app/dist/angular-conduit /usr/share/nginx/html
EXPOSE 80
