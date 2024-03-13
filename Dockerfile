# Use node:alpine image as the base image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install project dependencies
RUN npm install -g npm@10.5.0

# Copy the entire project to the container
COPY . .

# Build the Angular project
RUN npm run build

# Expose the port that the Angular app will run on
EXPOSE 4200

# Define the command to run your Angular app
CMD ["npm", "start"]
