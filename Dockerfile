FROM node:16 as build
WORKDIR /build
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN yarn static

FROM nginx
COPY --from=build /build/out /usr/share/nginx/html
