FROM node:22-bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip poppler-utils ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Aletvia_Impact_V1_Staging_Ready.zip /tmp/aletvia.zip
RUN unzip /tmp/aletvia.zip -d /app \
    && rm /tmp/aletvia.zip \
    && mkdir -p /data

ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV ALETVIA_DB_PATH=/data/aletvia-impact.sqlite

EXPOSE 8787
CMD ["node", "server.js"]
