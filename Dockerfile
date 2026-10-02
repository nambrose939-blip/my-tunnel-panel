FROM node:20-alpine

WORKDIR /app

# Install basic networking components quietly
RUN apk add --no-cache curl bash wget

# Pull a clean, web-compliant node runtime package
RUN npm install -g npm@latest

# Configure the local service runtime listener environment
ENV PORT=54321
EXPOSE 54321

# Launch a lightweight web listener to verify health status
CMD ["node", "-e", "const http = require('http'); http.createServer((req, res) => { res.writeHead(200); res.end('System Online'); }).listen(54321); console.log('Panel Listener Active on 54321');"]



