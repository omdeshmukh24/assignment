# --- Stage 1: Scraper (Node.js + Puppeteer) ---
FROM node:18-slim AS scraper

# Install Chromium for Puppeteer
RUN apt-get update && apt-get install -y chromium && apt-get clean

WORKDIR /app

# Install Node.js dependencies
COPY package.json ./
# Install Puppeteer without downloading Chromium
ENV PUPPETEER_SKIP_DOWNLOAD=true

RUN npm install

# Copy scraper script
COPY scrape.js ./

# Set URL (will be passed at build time)
ARG SCRAPE_URL=https://www.example.com
ENV SCRAPE_URL=${SCRAPE_URL}

# Run scraper at build time
RUN node scrape.js

# --- Stage 2: Web server (Python + Flask) ---
FROM python:3.10-slim AS server

WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy server code
COPY server.py ./

# Copy scraped data from Node.js stage
COPY --from=scraper /app/scraped_data.json ./

EXPOSE 5000

CMD ["python", "server.py"]
