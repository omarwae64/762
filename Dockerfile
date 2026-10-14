FROM node:18-alpine AS builder

WORKDIR /app

# نسخ ملفات الحزم لتسريع الـ Caching
COPY package*.json ./

RUN npm ci

COPY . .

# خفض استهلاك الـ Memory أثناء البناء
ENV NODE_OPTIONS="--max-old-space-size=512"
RUN npm run build

FROM nginx:alpine

# نسخ المجلد المخرج (تأكد هل اسم المجلد dist أم build لديك)
COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]