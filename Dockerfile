FROM node:18-alpine AS builder
 
WORKDIR /
COPY . .

# 这里的 BUILDTIME_ENV_EXAMPLE 会自动被设置
ARG BUILDTIME_ENV
ENV BUILDTIME_ENV=${BUILDTIME_ENV}

RUN npm i && npm run build || echo "Can't exec build cmd"

#FROM nginx:alpine

#COPY nginx.conf /etc/nginx/conf.d/configfile.template
#COPY --from=builder /app/dist /usr/share/nginx/html

ENV \
    PORT=8080 \
    HOST=0.0.0.0

EXPOSE 8080

CMD sh -c "npm run start"

#CMD sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/configfile.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
