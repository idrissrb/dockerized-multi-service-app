#Stage 1
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install --only=production

COPY src ./src

#Stage 2
FROM node:20-alpine

RUN apk add --no-cache curl 

WORKDIR /app

COPY --from=builder /app ./

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

USER appuser

EXPOSE 3000

CMD ["npm", "start"]
