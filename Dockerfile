FROM node:18 AS builder

WORKDIR /app

COPY . .

RUN yarn

RUN yarn build

FROM node:18-alpine

WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist

EXPOSE 3000
CMD ["node","./dist/main.js"]
