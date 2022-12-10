FROM node:18-alpine AS development
WORKDIR /usr/src/app
COPY . .
RUN yarn && yarn build
EXPOSE 3000

FROM node:18-alpine AS production
ENV NODE_ENV=production
WORKDIR /app
COPY package.json .
RUN npm ci --only=production
COPY --from=development ./app/build ./build
EXPOSE 3000
CMD [ "node", "build/index.js" ]