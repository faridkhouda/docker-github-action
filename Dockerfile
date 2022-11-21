# Step 1: 
FROM node:latest AS node

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# Step 2:
FROM nginx:alpine
COPY --from=node /app/dist/docker-github-action /usr/share/nginx/html
