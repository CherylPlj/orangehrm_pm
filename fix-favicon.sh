

#!/bin/bash

echo "🖼️  Fixing favicon issue..."
echo "📝 Ensuring no-text.png is used everywhere instead of favicon.ico"

# Copy favicon to all necessary locations
echo "📁 Copying no-text.png to all client directories..."
mkdir -p src/client/public
mkdir -p installer/client/public

if [ -f "web/images/no-text.png" ]; then
    cp web/images/no-text.png src/client/public/
    cp web/images/no-text.png installer/client/public/
    echo "✅ Favicon copied to client directories!"
else
    echo "⚠️  Warning: web/images/no-text.png not found!"
fi

# Ensure no-text.png is in web/dist
if [ -f "web/images/no-text.png" ] && [ -d "web/dist" ]; then
    cp web/images/no-text.png web/dist/
    echo "✅ Favicon copied to web/dist!"
fi

echo ""
echo "🔍 Checking for any remaining favicon.ico references..."
grep -r "favicon.ico" src/ || echo "✅ No favicon.ico references found in src/"

echo ""
echo "🔄 Rebuilding containers to apply changes..."
echo "⏹️  Stopping existing containers..."
docker-compose down

echo "🔨 Rebuilding containers..."
docker-compose up -d --build

echo "⏳ Waiting for containers to start..."
sleep 15

echo "📊 Container status:"
docker-compose ps

echo ""
echo "✅ Favicon fix complete!"
echo "🌐 Access your application:"
echo "   - Blue Eagles HR: http://localhost"
echo "   - phpMyAdmin: http://localhost:8080"
echo ""
echo "🖼️  The browser tab should now show the no-text.png icon!"
echo "📝 If you still don't see the new icon, try:"
echo "   - Hard refresh (Ctrl+F5 or Cmd+Shift+R)"
echo "   - Clear browser cache completely"
echo "   - Open in incognito/private mode"
echo "   - Check browser developer tools (F12) > Network tab for favicon requests"
echo "   - Wait a few minutes for all services to fully start"
