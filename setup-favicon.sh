#!/bin/bash

echo "🖼️  Setting up Blue Eagles HR favicon..."

# Copy favicon to client directories
echo "📁 Copying no-text.png to client directories..."
mkdir -p src/client/public
mkdir -p installer/client/public

if [ -f "web/images/no-text.png" ]; then
    cp web/images/no-text.png src/client/public/
    cp web/images/no-text.png installer/client/public/
    echo "✅ Favicon copied successfully!"
else
    echo "⚠️  Warning: web/images/no-text.png not found!"
    echo "   Please ensure the file exists before rebuilding."
fi

echo ""
echo "🔄 Rebuilding containers with new favicon..."
echo "⏹️  Stopping existing containers..."
docker-compose down

echo "🔨 Rebuilding containers..."
docker-compose up -d --build

echo "⏳ Waiting for containers to start..."
sleep 10

echo "📊 Container status:"
docker-compose ps

echo ""
echo "✅ Setup complete!"
echo "🌐 Access your application:"
echo "   - Blue Eagles HR: http://localhost"
echo "   - phpMyAdmin: http://localhost:8080"
echo ""
echo "🖼️  The browser tab should now show the no-text.png icon!"
echo "📝 If you don't see the new icon, try:"
echo "   - Hard refresh (Ctrl+F5 or Cmd+Shift+R)"
echo "   - Clear browser cache"
echo "   - Check browser developer tools for any errors"
