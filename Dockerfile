# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and install deps
COPY package*.json ./
RUN npm install

# Copy rest of the code
COPY . .

# App runs on port 3000
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
