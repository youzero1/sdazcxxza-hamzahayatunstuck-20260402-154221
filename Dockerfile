# ============================================================
# Stage 1: Build Stage
# ============================================================
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files first (layer caching optimization)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci --only=production

# Copy all source files
COPY . .

# ============================================================
# Stage 2: Production Stage
# ============================================================
FROM nginx:1.25-alpine AS production

# Add labels for metadata
LABEL maintainer="NovaTech <hello@novatech.io>"
LABEL version="1.0.0"
LABEL description="NovaTech About Us Webpage"

# Remove default nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy static files from builder stage
COPY --from=builder /app/index.html /usr/share/nginx/html/index.html
COPY --from=builder /app/styles.css /usr/share/nginx/html/styles.css

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:80/ || exit 1

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]