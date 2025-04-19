# Step 1: Use the official Node.js image as a base
FROM node:16-alpine

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application code
COPY . .

# Step 6: Expose the port that Vite uses (default is 5173)
EXPOSE 5173

# Step 7: Run Vite dev server (not recommended for production)
CMD ["npm", "run", "dev"]
