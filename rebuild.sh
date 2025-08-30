#!/bin/bash

echo "🔄 Rebuilding OrangeHRM containers with custom changes..."
echo "📝 Your changes to 'Blue Eagles HR' will be applied!"
echo "🎨 Blue theme colors: #004eaa (primary/secondary), #009DFF (gradient end)"

# Copy favicon to client directories
echo "🖼️  Copying favicon..."
mkdir -p src/client/public
mkdir -p installer/client/public
cp web/images/no-text.png src/client/public/ 2>/dev/null || echo "⚠️  no-text.png not found, using default favicon"
cp web/images/no-text.png installer/client/public/ 2>/dev/null || echo "⚠️  no-text.png not found, using default favicon"

# Stop existing containers
echo "⏹️  Stopping existing containers..."
docker-compose down

# Rebuild and start containers
echo "🔨 Rebuilding containers..."
docker-compose up -d --build

# Wait a moment for containers to start
echo "⏳ Waiting for containers to start..."
sleep 10

# Show container status
echo "📊 Container status:"
docker-compose ps

echo ""
echo "✅ Rebuild complete!"
echo "🌐 Access your application:"
echo "   - Blue Eagles HR: http://localhost"
echo "   - phpMyAdmin: http://localhost:8080"
echo ""
echo "🔑 Database credentials:"
echo "   - Username: orangehrm"
echo "   - Password: orangehrm123"
echo ""
echo "📝 Your custom title 'Blue Eagles HR' should now appear in the browser!"
