# 🕷️ Web Scraper + Flask Server (Multi-stage Docker Build)

This project scrapes a website using Puppeteer in a Node.js environment, saves the data, and serves it through a Flask API in Python — all wrapped in a multi-stage Docker container.

## 📦 What's Inside?

- **Node.js + Puppeteer**: Headless browser scraping.
- **Python + Flask**: Lightweight API server to serve scraped data.
- **Docker Multi-Stage Build**: Efficient, clean image with isolated concerns.

## 🛠️ How It Works
The Puppeteer script (scrape.js) opens a webpage, extracts the title and heading, and stores it in scraped_data.json.
The Flask server (server.py) reads the scraped_data.json and serves the extracted data via a REST API at http://localhost:5000.
The whole system is containerized using Docker for easy deployment.

## 🚀 Getting Started

### 1. **Clone the Repository**
```
git clone GitHub-repo-url

cd repo-url
```
### 2. **Build the Docker Image**
```
docker build . -t scraper-server
```

### 3. **Run the Container**
```
docker run -p 5000:5000 scraper-server
```
Access the Application

http://localhost:5000/

## 📄 Example Output

```json
{
  "title": "Example Domain",
  "heading": "Example Domain"
}
```
## 🧹 To Clean Up (optional)

To stop and remove the running container:

docker ps

docker stop <container_id>

docker rm <container_id>
