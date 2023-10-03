FROM node:16 AS builder
WORKDIR /ums-frontend
COPY . .
RUN yarn install
RUN yarn build

FROM nginx:1.21-alpine
COPY --from=builder /ums-frontend/dist /usr/share/nginx/html
