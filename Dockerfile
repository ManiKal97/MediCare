FROM node:22.13.1 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . ./
RUN npm run build --prod
FROM nginx:latest
COPY --from=builder /app/dist/medi-care /usr/share/nginx/html
EXPOSE 80
CMD ["nginx","-g","daemon off;"]