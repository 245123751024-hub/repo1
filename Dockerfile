# Use Node.js 18 image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application
COPY . .

# Expose the port
EXPOSE 8081

# Start the application
CMD ["npm", "start"]
