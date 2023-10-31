ARG BUILD_IMAGE=node:20.1.0
ARG RUN_IMAGE=gcr.io/distroless/nodejs20-debian11

# Build stage
FROM $BUILD_IMAGE AS builder

COPY package.json package-lock.json /app/
WORKDIR /app
RUN npm ci

COPY . /app
RUN npm run build

# Package stage
FROM $BUILD_IMAGE AS packager

COPY package.json package-lock.json /
RUN npm ci --omit=dev

# Create final production stage
FROM $RUN_IMAGE AS run-env

WORKDIR /usr/app
COPY --from=packager /node_modules ./node_modules
COPY --from=builder /app/dist ./dist

ENV NODE_ENV="production"
EXPOSE 3000
USER nobody
CMD ["dist/src/index.js"]