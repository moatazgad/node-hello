


# Use the official Node.js runtime as the base image
FROM node:18-alpine AS base

ENV NEW_RELIC_NO_CONFIG_FILE=true
ENV NEW_RELIC_DISTRIBUTED_TRACING_ENABLED=true
ENV NEW_RELIC_LOG=stdout

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the application
# CMD ["npm", "start"] 
CMD ["node", "-r", "newrelic", "index.js"]