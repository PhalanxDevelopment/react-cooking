# Stage 1: Build
FROM node:9.4.0 as builder

RUN mkdir /source/
WORKDIR /source/
ADD . /source/

RUN npm install 
RUN npm run build --production

# Stage 2: Copy dst folder
FROM library/alpine:edge

RUN mkdir /dist && mkdir /data

COPY --from=builder /source/build/ /dist

CMD cp -rp /dist/* /data