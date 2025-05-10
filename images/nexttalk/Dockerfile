# Stage 1: Build stage
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Install dependencies only
COPY package*.json ./
RUN npm install --frozen-lockfile

# Copy only source code needed to build the app
COPY . .

# Optional: Build if using static export
# RUN npm run build

# Stage 2: Production-ready image
FROM node:20-alpine

WORKDIR /app

# Copy node_modules from builder
COPY --from=builder /app/node_modules ./node_modules

# Copy only necessary files for runtime (adjust if using next export)
COPY .next .next
COPY app app
COPY public public
COPY package*.json ./
COPY next.config.ts next.config.ts
COPY next-env.d.ts next-env.d.ts
COPY tsconfig.json tsconfig.json
COPY postcss.config.mjs postcss.config.mjs

# Expose the port Next.js runs on
EXPOSE 3000

# Run app
CMD ["npm", "run", "dev"]
