#!/bin/bash

# Script to generate placeholder app icons for Android
# This creates simple colored squares as temporary placeholders
# Replace these with your actual app icon later

echo "Generating placeholder Android app icons..."

# Function to create a colored square PNG using ImageMagick
create_icon() {
    size=$1
    output=$2

    # Check if ImageMagick is installed
    if command -v convert &> /dev/null; then
        convert -size ${size}x${size} xc:"#6366F1" \
                -gravity center \
                -pointsize $((size/3)) \
                -fill white \
                -annotate +0+0 "UT" \
                "$output"
        echo "Created: $output"
    else
        echo "ImageMagick not found. Please install it or use flutter_launcher_icons package."
        echo "To install: "
        echo "  - Ubuntu/Debian: sudo apt-get install imagemagick"
        echo "  - macOS: brew install imagemagick"
        echo "  - Windows: Download from https://imagemagick.org/script/download.php"
        exit 1
    fi
}

# Create icons for different densities
create_icon 72 "android/app/src/main/res/mipmap-hdpi/ic_launcher.png"
create_icon 48 "android/app/src/main/res/mipmap-mdpi/ic_launcher.png"
create_icon 96 "android/app/src/main/res/mipmap-xhdpi/ic_launcher.png"
create_icon 144 "android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png"
create_icon 192 "android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png"

echo ""
echo "✓ Placeholder icons generated successfully!"
echo ""
echo "IMPORTANT: These are temporary placeholders."
echo "Generate proper app icons using flutter_launcher_icons:"
echo ""
echo "1. Add your logo to: assets/logos/app_logo.png (512x512)"
echo "2. Add to pubspec.yaml dev_dependencies:"
echo "   flutter_launcher_icons: ^0.13.1"
echo ""
echo "3. Add configuration:"
echo "   flutter_launcher_icons:"
echo "     android: true"
echo "     ios: true"
echo "     image_path: \"assets/logos/app_logo.png\""
echo "     adaptive_icon_background: \"#6366F1\""
echo ""
echo "4. Run: flutter pub run flutter_launcher_icons"
echo ""
