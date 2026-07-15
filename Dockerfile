# ---------- Build Stage ----------
FROM node:22-alpine AS builder

WORKDIR /app

# Enable Corepack (includes pnpm)
RUN corepack enable

# Copy dependency files first for better layer caching
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy the rest of the source
COPY . .

# Build the Vite app
RUN pnpm run build


# ---------- Production Stage ----------
FROM nginx:1.27-alpine

# Copy built files
COPY --from=builder /app/dist /usr/share/nginx/html

# Configure nginx to listen on port 3001
RUN sed -i 's/listen\s\+80;/listen 3001;/' /etc/nginx/conf.d/default.conf

EXPOSE 3001

CMD ["nginx", "-g", "daemon off;"]
