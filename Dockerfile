# ---------- Stage 1: Build the Next.js app ----------
FROM node:18-alpine AS builder

WORKDIR /app

# Copy only the Next.js app
COPY my-nextjs-app/ ./

# Install dependencies
RUN npm install

# Build the Next.js app
RUN npm run build

# ---------- Stage 2: Run the production build ----------
FROM node:18-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production

# Copy only the built files from builder
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules

EXPOSE 3000
CMD ["npm", "start"]
