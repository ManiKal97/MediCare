from node:22.13.1 AS builder
WORKDIR /app
copy package*.json./
RUN npm install
copy . ./
RUN npm run build --prod
from nginx:alphine
copy --from=builder /app/dist/medi-care /usr/share/nginx/html
expose 80
CMD ["nginx","-g","daemon off;"]