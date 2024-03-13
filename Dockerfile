# Use an official Node.js runtime as the base image
FROM node:18 as builder

WORKDIR /app

# Install Angular CLI globally
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Angular project
RUN ng build

# Stage 2: Runtime Stage
FROM nginx:alpine

# Copy the built Angular app from the builder stage to the NGINX HTML directory
COPY --from=builder /app/dist/<your-angular-app-name> /usr/share/nginx/html

# Expose the port that the Angular app will run on
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
