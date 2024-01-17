# Use an official Node.js LTS (Long Term Support) image as the base image
FROM node:lts

# Set the working directory in the container
WORKDIR /

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the entire project to the container
COPY . .

# Build the Angular project
RUN npm run build
# Expose the port that the Angular app will run on
EXPOSE 4200

# Define the command to run your Angular app
CMD ["npm", "start"]
