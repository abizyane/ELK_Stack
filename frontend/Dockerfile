FROM node:20.17-alpine3.20 AS builder

WORKDIR /app

COPY app/package*.json ./

RUN npm install --loglevel=error

COPY app/. .

FROM node:20.17-alpine3.20

WORKDIR /app

COPY --from=builder /app ./

CMD ["npm", "run", "dev", "--", "--host"]