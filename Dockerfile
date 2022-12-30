FROM node:18-alpine as base

############################################
FROM base AS development

WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile
COPY . .
RUN yarn build
EXPOSE 3000

############################################
FROM base AS production

ENV NODE_ENV=production
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production --frozen-lockfile
COPY --from=development ./app/build ./build
EXPOSE 3000
CMD [ "node", "build/index.js" ]