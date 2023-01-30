ARG TINI_VERSION=v0.19.0
ARG API_PORT=8080

# Builder
FROM node:18 as builder

WORKDIR /app

COPY . .

RUN npm install; \
    npm run build

# Container
FROM node:18

ARG TINI_VERSION
ARG API_PORT

WORKDIR /app

# Add Tini
# Reference: https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#handling-kernel-signals
# Reference: https://github.com/krallin/tini#using-tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

RUN chmod +x /tini

COPY --from=builder /app/dist/. .

ENV API_PORT=${API_PORT}

EXPOSE ${API_PORT}

# ENTRYPOINT ["node", "dist/server.js"]
ENTRYPOINT ["/tini", "--"]

CMD ["node", "server.js"]
