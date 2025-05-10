# 1. 開発依存込みでインストールするステージ
FROM node:22-slim AS development-dependencies-env

# Corepack (pnpm), git, 他開発用に必要な最低限ツール
RUN apt-get update && apt-get install -y git curl && \
    corepack enable && corepack prepare pnpm@latest --activate

WORKDIR /app
COPY . .
RUN pnpm install


# 2. 本番依存のみインストールするステージ
FROM node:22-slim AS production-dependencies-env

RUN apt-get update && apt-get install -y curl && \
    corepack enable && corepack prepare pnpm@latest --activate

WORKDIR /app
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
RUN pnpm install --prod

# 3. アプリをビルドするステージ
FROM node:22-slim AS build-env

RUN apt-get update && apt-get install -y curl && \
    corepack enable && corepack prepare pnpm@latest --activate

WORKDIR /app
COPY . .
COPY --from=development-dependencies-env /app/node_modules ./node_modules
RUN pnpm build

# 4. 本番実行用ステージ
FROM node:22-slim

RUN apt-get update && apt-get install -y curl && \
    corepack enable && corepack prepare pnpm@latest --activate && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY --from=production-dependencies-env /app/node_modules ./node_modules
COPY --from=build-env /app/build ./build

# React Router v7 に対応した本番起動
CMD ["pnpm", "start"]