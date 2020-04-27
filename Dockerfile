# Build Phase
FROM node:alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN ls -al
RUN ls -al public
RUN npm run build

# Run Phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
