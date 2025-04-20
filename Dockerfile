# Step 1: Build the Vite app
FROM node:16-alpine AS build

WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app and build it
COPY . .
RUN npm run build

# Step 2: Serve the app using 'serve'
FROM node:16-alpine

WORKDIR /app

# Install the 'serve' package globally
RUN npm install -g serve

# Copy the build output from the previous stage
COPY --from=build /app/dist ./dist

# Expose Vite's default port
EXPOSE 5173

# Start the server
CMD ["serve", "-s", "dist", "-l", "5173"]
