FROM node:18-alpine

COPY . ./app

RUN adduser myuser -D && chown -R myuser /app

USER myuser
WORKDIR /app

RUN npm i

EXPOSE 5173

ENTRYPOINT [ "npm", "run", "dev"]
