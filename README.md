# StudReg - Student Registration Web Application

A modern, fully Dockerized Student Registration web application built with Node.js, Express, and a responsive HTML5/CSS3 frontend.

## Features

✨ **Modern UI**
- Clean, card-based design with gradient backgrounds
- Fully responsive layout (mobile, tablet, desktop)
- Smooth animations and transitions
- Professional color scheme

📋 **Complete Form**
- Name field
- Contact number
- Gender selection (radio buttons)
- Address (textarea)
- Hobbies (multi-select checkboxes)
- Skillset dropdown
- Highest Qualification dropdown
- District dropdown (all Indian districts)

🚀 **Backend Features**
- Express.js server
- Static file serving
- GET request form processing
- JSON response with all submitted data
- Error handling
- Timestamp tracking

🐳 **Docker Support**
- Multi-stage Dockerfile with node:18-alpine
- Docker Compose configuration
- Easy deployment
- Volume mounts for development

## Project Structure

```
StudReg/
├── public/
│   └── studreg.html          # Frontend form with styling
├── studregnode.js             # Express server
├── package.json               # Dependencies and scripts
├── Dockerfile                 # Docker image configuration
├── docker-compose.yaml        # Docker Compose setup
├── .gitignore                 # Git ignore rules
└── README.md                  # This file
```

## Prerequisites

- Node.js 18+ (for local development)
- npm (for local development)
- Docker & Docker Compose (for containerized deployment)

## Local Development

### 1. Install Dependencies

```bash
cd StudReg
npm install
```

### 2. Run the Server Locally

```bash
npm start
```

The application will be available at: `http://localhost:8081/studreg.html`

### 3. Test the Form

- Fill out all required fields
- Select options from dropdowns
- Check hobbies (optional)
- Click "Submit"
- View the JSON response in the browser

## Docker Deployment

### Build and Run with Docker

```bash
# Build the Docker image
docker build -t studregimage .

# Run the container
docker run -p 8081:8081 studregimage
```

### Using Docker Compose

```bash
# Start the application
docker-compose up -d

# View logs
docker-compose logs -f web

# Stop the application
docker-compose down
```

The application will be available at: `http://localhost:8081/studreg.html`

## API Endpoints

### GET /studreg.html
Serves the registration form page.

### GET /process_get
Processes form submission via query parameters.

**Request:**
```
GET /process_get?name=John&contact=9876543210&gender=Male&address=123 Street&hobbies=Reading, Sports&skillset=Full-Stack&qualification=Bachelor&district=Pune
```

**Response:**
```json
{
  "name": "John",
  "contact": "9876543210",
  "gender": "Male",
  "address": "123 Street",
  "hobbies": ["Reading", "Sports"],
  "skillset": "Full-Stack",
  "qualification": "Bachelor",
  "district": "Pune",
  "submittedAt": "2026-04-20T12:00:00.000Z",
  "message": "Form submitted successfully!"
}
```

### GET /
Redirects to `/studreg.html`

## Form Validation

✅ **Client-side validation:**
- All required fields must be filled
- Real-time error messages
- Field focus effects

✅ **Server-side handling:**
- Graceful fallback for missing fields
- Default "Not provided" values
- Comprehensive error responses

## Technologies Used

- **Frontend:** HTML5, CSS3, Vanilla JavaScript
- **Backend:** Node.js, Express.js
- **Containerization:** Docker, Docker Compose
- **Server:** Port 8081

## Styling Features

- Linear gradient backgrounds
- Card layout with shadows
- Rounded input elements
- Hover effects on buttons
- Smooth transitions
- Responsive grid system
- Mobile-first design
- Accessibility considerations

## Troubleshooting

### Port 8081 already in use
```bash
# Kill the process using port 8081
sudo lsof -i :8081
sudo kill -9 <PID>
```

### Docker issues
```bash
# Remove old containers
docker rm nodecons

# Remove old images
docker rmi studregimage

# Rebuild
docker-compose up --build
```

### Dependencies not installing
```bash
# Clear npm cache
npm cache clean --force

# Reinstall
npm install
```

## Performance Notes

- Uses Alpine Linux base image for smaller footprint
- Production-optimized npm install
- Static file serving with express.static
- Efficient form data handling

## Security Considerations

- Input validation on both client and server
- Error messages don't expose sensitive information
- CORS-ready for future API extensions
- Secure defaults in all configurations

## License

ISC

## Author

StudReg Development Team

---

**Version:** 1.0.0  
**Last Updated:** April 2026
