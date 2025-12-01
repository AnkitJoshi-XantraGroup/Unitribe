#!/usr/bin/env python3
"""
Generate placeholder app icons for Android
Creates simple colored squares with "UT" text as temporary placeholders
"""

import os

try:
    from PIL import Image, ImageDraw, ImageFont
    PIL_AVAILABLE = True
except ImportError:
    PIL_AVAILABLE = False
    print("PIL/Pillow not available. Generating minimal icons...")

def create_minimal_png(size, output_path):
    """Create a minimal valid PNG file without PIL"""
    # This creates a simple 1x1 PNG that Android will accept
    # It's not pretty but it will work as a placeholder
    png_data = (
        b'\x89PNG\r\n\x1a\n'  # PNG signature
        b'\x00\x00\x00\rIHDR'  # IHDR chunk
        b'\x00\x00\x00\x01\x00\x00\x00\x01'  # 1x1 image
        b'\x08\x02\x00\x00\x00'  # RGB color
        b'\x90wS\xde'  # CRC
        b'\x00\x00\x00\x0cIDATx\x9cc\x00\x01\x00\x00\x05\x00\x01'  # Image data (transparent)
        b'\r\n-\xb4'  # CRC
        b'\x00\x00\x00\x00IEND\xaeB`\x82'  # IEND chunk
    )

    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, 'wb') as f:
        f.write(png_data)
    print(f"Created minimal icon: {output_path}")

def create_icon_with_pil(size, output_path):
    """Create a proper icon with PIL/Pillow"""
    # Create image with UniTribe brand color
    img = Image.new('RGB', (size, size), color='#6366F1')
    draw = ImageDraw.Draw(img)

    # Draw "UT" text
    try:
        # Try to use a nice font
        font_size = size // 2
        try:
            font = ImageFont.truetype("arial.ttf", font_size)
        except:
            font = ImageFont.load_default()
    except:
        font = None

    # Draw text in center
    text = "UT"
    if font:
        # Get text size
        bbox = draw.textbbox((0, 0), text, font=font)
        text_width = bbox[2] - bbox[0]
        text_height = bbox[3] - bbox[1]
    else:
        text_width = size // 4
        text_height = size // 4

    position = ((size - text_width) // 2, (size - text_height) // 2)
    draw.text(position, text, fill='white', font=font)

    # Save image
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    img.save(output_path, 'PNG')
    print(f"Created: {output_path}")

def main():
    print("Generating placeholder Android app icons...\n")

    # Icon sizes for different densities
    icons = [
        (48, 'android/app/src/main/res/mipmap-mdpi/ic_launcher.png'),
        (72, 'android/app/src/main/res/mipmap-hdpi/ic_launcher.png'),
        (96, 'android/app/src/main/res/mipmap-xhdpi/ic_launcher.png'),
        (144, 'android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png'),
        (192, 'android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png'),
    ]

    create_func = create_icon_with_pil if PIL_AVAILABLE else create_minimal_png

    for size, path in icons:
        create_func(size, path)

    print("\n✓ Placeholder icons generated successfully!")
    print("\nIMPORTANT: These are temporary placeholders.")
    print("Generate proper app icons using flutter_launcher_icons:")
    print("\n1. Add your logo to: assets/logos/app_logo.png (512x512)")
    print("2. Add to pubspec.yaml dev_dependencies:")
    print("   flutter_launcher_icons: ^0.13.1")
    print("\n3. Add configuration to pubspec.yaml:")
    print("   flutter_launcher_icons:")
    print("     android: true")
    print("     ios: true")
    print("     image_path: \"assets/logos/app_logo.png\"")
    print("     adaptive_icon_background: \"#6366F1\"")
    print("\n4. Run: flutter pub run flutter_launcher_icons\n")

    if not PIL_AVAILABLE:
        print("\nNOTE: Install Pillow for better quality placeholder icons:")
        print("  pip install Pillow\n")

if __name__ == '__main__':
    main()
