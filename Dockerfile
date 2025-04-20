# Step 1: Use the official Node.js image as a base
FROM node:16-alpine

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy package.json and lock file
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application
COPY . .

# Step 6: Expose Vite's default dev port
EXPOSE 5173

# Step 7: Run Vite dev server, accessible from outside the container
CMD ["npm", "run", "dev", "--", "--host"]
