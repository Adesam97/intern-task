# Use an official Node.js runtime as the base image
FROM node:14-slim

# Set the working directory in the container
WORKDIR /myapp

# Initialize working directory to create a package.json file for your application
RUN npm init -y

# install Express
RUN npm install express

# Copy app.js to /myapp
COPY app.js ./

# Run a command in the myapp/ directory
CMD ["node", "app.js"]