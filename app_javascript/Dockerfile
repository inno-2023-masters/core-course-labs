FROM node:18-alpine AS build

RUN addgroup user && adduser svelteapp -g user --disabled-password

USER svelteapp

WORKDIR /app

#COPY  --chown=app:app ./app /code/app
COPY --chown=svelteapp:user  package.json ./
COPY --chown=svelteapp:user  package-lock.json ./
RUN npm install
COPY --chown=svelteapp:user  . ./
RUN npm run build

FROM nginx:1.19-alpine
COPY --from=build /app/dist /usr/share/nginx/html