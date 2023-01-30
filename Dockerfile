FROM node:18

ENV TINI_VERSION=v0.19.0
ENV API_PORT=8080

WORKDIR /app

COPY . .

# Add Tini
# Reference: https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#handling-kernel-signals
# Reference: https://github.com/krallin/tini#using-tini

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

RUN chmod +x /tini; \
    npm install; \
    npm run build

EXPOSE ${API_PORT}

# ENTRYPOINT ["node", "dist/server.js"]
ENTRYPOINT ["/tini", "--"]

CMD ["node", "dist/server.js"]
