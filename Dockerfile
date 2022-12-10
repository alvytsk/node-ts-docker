FROM node:18-alpine AS development
WORKDIR /usr/src/app
COPY . .
RUN yarn && yarn build

FROM node:18-alpine AS production
ENV NODE_ENV=production
WORKDIR /app
COPY package.json .
RUN npm ci --only=production
COPY --from=development ./app/build ./build
CMD [ "node", "build/index.js" ]