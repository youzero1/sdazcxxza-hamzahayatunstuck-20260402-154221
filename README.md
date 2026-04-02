# NovaTech — About Us Webpage

A modern, fully responsive **About Us** webpage built with pure HTML and CSS. Features a dark theme with vibrant gradients, smooth animations, and a complete company profile layout.

---

## Features

- Responsive navigation with glassmorphism effect
- Animated hero section with floating cards
- Statistics counter section
- Mission & Vision with Core Values grid
- Team member cards with social links
- Interactive timeline / company history
- Call-to-action section
- Fully responsive footer
- Smooth hover animations throughout
- Mobile-first responsive design

---

## Project Structure

```
about-us-webpage/
├── index.html          # Main HTML file
├── styles.css          # All CSS styles
├── package.json        # NPM project config
├── package-lock.json   # Locked dependency versions
├── Dockerfile          # Multi-stage Docker build
├── nginx.conf          # Nginx server configuration
├── .dockerignore       # Docker ignore rules
└── README.md           # This file
```

---

## Getting Started

### Option 1: Open Directly

Simply open `index.html` in any modern browser — no build step required.

### Option 2: Run with Node (live-server)

```bash
# Install dependencies
npm install

# Start development server with live reload
npm run dev
```

Visit `http://localhost:3000`

### Option 3: Run with Docker

```bash
# Build the Docker image
docker build -t novatech-about-us .

# Run the container
docker run -d -p 8080:80 --name novatech-app novatech-about-us
```

Visit `http://localhost:8080`

### Option 4: Docker Compose (optional)

```bash
docker-compose up -d
```

---

## Docker Details

The `Dockerfile` uses a **multi-stage build**:

| Stage | Base Image | Purpose |
|-------|------------|---------|
| `builder` | `node:18-alpine` | Install deps, prepare files |
| `production` | `nginx:1.25-alpine` | Serve static files efficiently |

The final image is minimal (~25MB) and production-ready.

---

## Customization

| What to change | Where |
|----------------|-------|
| Company name / content | `index.html` |
| Colors & fonts | `styles.css` (`:root` variables) |
| Team members | `index.html` (`.team-grid` section) |
| Timeline events | `index.html` (`.timeline` section) |
| Stats numbers | `index.html` (`.stats` section) |

---

## Browser Support

- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

---

## License

MIT © 2024 NovaTech