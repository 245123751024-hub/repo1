const express = require('express');
const path = require('path');

const app = express();
const PORT = 8081;

// Middleware to serve static files from public folder
app.use(express.static(path.join(__dirname, 'public')));

// Route to serve the HTML form
app.get('/studreg.html', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'studreg.html'));
});

// Route to process form data via GET request
app.get('/process_get', (req, res) => {
    try {
        // Extract all query parameters
        const formData = {
            name: req.query.name || 'Not provided',
            contact: req.query.contact || 'Not provided',
            gender: req.query.gender || 'Not provided',
            address: req.query.address || 'Not provided',
            hobbies: req.query.hobbies ? req.query.hobbies.split(', ').filter(h => h) : [],
            skillset: req.query.skillset || 'Not provided',
            qualification: req.query.qualification || 'Not provided',
            district: req.query.district || 'Not provided',
            submittedAt: new Date().toISOString(),
            message: 'Form submitted successfully!'
        };

        // Send JSON response
        res.json(formData);
    } catch (error) {
        console.error('Error processing form:', error);
        res.status(500).json({
            error: 'Error processing form',
            message: error.message
        });
    }
});

// Root route - redirect to form
app.get('/', (req, res) => {
    res.redirect('/studreg.html');
});

// 404 handler
app.use((req, res) => {
    res.status(404).json({
        error: 'Not Found',
        message: 'The requested endpoint does not exist',
        path: req.path
    });
});

// Error handler
app.use((err, req, res, next) => {
    console.error('Server error:', err);
    res.status(500).json({
        error: 'Server Error',
        message: err.message
    });
});

// Start server
app.listen(PORT, () => {
    console.log(`✓ Student Registration Server is running on http://localhost:${PORT}`);
    console.log(`✓ Open http://localhost:${PORT}/studreg.html in your browser`);
});
