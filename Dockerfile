# Use an official Node.js runtime as the base image
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

# Install Angular CLI globally
#RUN npm install -g @angular/cli

# Install project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Angular project
RUN ng build

# Expose the port that the Angular app will run on
EXPOSE 4200

# Start NGINX
CMD ["npm", "start"]
