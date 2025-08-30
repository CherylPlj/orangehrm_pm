#!/bin/bash

echo "🔄 Copying no-text.png to client public directories..."

# Create directories if they don't exist
mkdir -p src/client/public
mkdir -p installer/client/public

# Copy no-text.png to both client public directories
cp web/images/no-text.png src/client/public/
cp web/images/no-text.png installer/client/public/

echo "✅ Favicon copied successfully!"
echo "📝 The browser will now show the no-text.png icon in the title bar."
echo ""
echo "🔄 You may need to rebuild your containers to see the changes:"
echo "   docker-compose down"
echo "   docker-compose up -d --build"
