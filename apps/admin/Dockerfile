FROM node:18 AS build
WORKDIR /app
COPY apps/admin/package*.json ./
COPY apps/admin/yarn.lock ./
RUN npm ci --legacy-peer-deps
COPY apps/admin/ ./
RUN npm run build

FROM node:18-slim
WORKDIR /app
RUN npm install -g serve
COPY --from=build /app/dist ./dist
EXPOSE 5173
CMD ["serve", "-s", "dist", "-l", "5173"]
