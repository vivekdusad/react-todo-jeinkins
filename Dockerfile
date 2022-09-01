FROM node:14-alpine3.12 as builder

WORKDIR /var/app
ENV NODE_ENV=production
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 8080
COPY --from=builder /var/app/build /usr/share/nginx/html
