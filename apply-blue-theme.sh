#!/bin/bash

echo "🎨 Applying Blue Eagles HR Theme..."
echo "📝 Colors:"
echo "   Primary Color: #004eaa"
echo "   Secondary Color: #004eaa"
echo "   Primary Font Color: #FFFFFF (retained)"
echo "   Secondary Font Color: #FFFFFF (retained)"
echo "   Primary Gradient Color 1: #004eaa"
echo "   Primary Gradient Color 2: #009DFF"

# Copy favicon to client directories
echo ""
echo "🖼️  Setting up favicon..."
mkdir -p src/client/public
mkdir -p installer/client/public

if [ -f "web/images/no-text.png" ]; then
    cp web/images/no-text.png src/client/public/
    cp web/images/no-text.png installer/client/public/
    echo "✅ Favicon copied successfully!"
else
    echo "⚠️  Warning: web/images/no-text.png not found!"
fi

echo ""
echo "🔄 Rebuilding containers with new blue theme..."
echo "⏹️  Stopping existing containers..."
docker-compose down

echo "🔨 Rebuilding containers..."
docker-compose up -d --build

echo "⏳ Waiting for containers to start..."
sleep 15

echo "📊 Container status:"
docker-compose ps

echo ""
echo "✅ Blue Eagles HR theme applied successfully!"
echo "🌐 Access your application:"
echo "   - Blue Eagles HR: http://localhost"
echo "   - phpMyAdmin: http://localhost:8080"
echo ""
echo "🎨 Theme changes include:"
echo "   - Blue primary and secondary colors (#004eaa)"
echo "   - Blue gradient from #004eaa to #009DFF"
echo "   - Custom favicon (no-text.png)"
echo "   - Blue Eagles HR branding"
echo "   - Footer copyright changed to 'Blue Eagles'"
echo "   - Social media links removed from login"
echo "   - External OrangeHRM links removed"
echo "   - Upgrade button removed from top bar"
echo "   - Social media components commented out (preserved)"
echo ""
echo "📝 If you don't see the theme changes immediately:"
echo "   - Hard refresh (Ctrl+F5 or Cmd+Shift+R)"
echo "   - Clear browser cache"
echo "   - Wait a few minutes for all services to fully start"
