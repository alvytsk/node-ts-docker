FROM node:18-alpine AS builder
WORKDIR /app
COPY . .
RUN yarn && yarn build

FROM node:18-alpine AS production
ENV NODE_ENV=production
WORKDIR /app
COPY --from=builder ./app/build ./build
COPY package.json .
COPY yarn.lock .
RUN yarn install --production
CMD [ "yarn", "start" ]