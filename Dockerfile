# Use node:alpine image as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install project dependencies
RUN npm install --save-dev @angular-devkit/build-angular

# Copy the entire project to the container
COPY . .

# Build the Angular project
RUN ng build

# Expose the port that the Angular app will run on
EXPOSE 4200

# Define the command to run your Angular app
CMD ["npm", "start"]
