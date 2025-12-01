# Assets Setup Guide

Quick guide to add assets to your UniTribe app.

## Directory Structure

```
assets/
├── images/          # General images, placeholders, backgrounds
│   └── README.md    # Detailed image guidelines
├── icons/           # Custom icons and UI elements
│   └── README.md    # Icon specifications
├── logos/           # Branding, app logos, university logos
│   └── README.md    # Logo requirements
└── fonts/           # Custom fonts (optional)
    └── README.md    # Font configuration

web/icons/           # Web-specific PWA icons
└── README.md        # Web icon requirements
```

## Quick Start: Adding Your First Assets

### Step 1: Add Your University Logo

1. Place your logo in `assets/logos/`
   ```
   assets/logos/university_logo.png
   ```

2. Use in code:
   ```dart
   Image.asset('assets/logos/university_logo.png', height: 60)
   ```

### Step 2: Add App Icon

1. Create a 512x512px app icon
2. Save as `assets/logos/app_logo.png`

3. Auto-generate platform icons:
   ```bash
   # Add to pubspec.yaml dev_dependencies:
   flutter_launcher_icons: ^0.13.1

   # Add configuration:
   flutter_launcher_icons:
     android: true
     ios: true
     web: true
     image_path: "assets/logos/app_logo.png"
     adaptive_icon_background: "#6366F1"
     adaptive_icon_foreground: "assets/logos/app_logo.png"

   # Run generator:
   flutter pub get
   flutter pub run flutter_launcher_icons
   ```

### Step 3: Add Placeholder Images

Essential placeholders for better UX:

```
assets/images/placeholder_user.png      (300x300)
assets/images/placeholder_news.png      (800x600)
assets/images/placeholder_event.png     (800x600)
assets/images/no_image.png             (400x400)
```

### Step 4: Web Icons (PWA)

For web deployment, add to `web/icons/`:

```
web/icons/Icon-192.png
web/icons/Icon-512.png
web/icons/Icon-maskable-192.png
web/icons/Icon-maskable-512.png
```

Or use flutter_launcher_icons to generate them automatically.

## Asset Configuration

### Already Configured in pubspec.yaml

```yaml
flutter:
  uses-material-design: true

  assets:
    - assets/images/
    - assets/icons/
    - assets/logos/

  fonts:
    - family: CustomIcons
      fonts:
        - asset: assets/fonts/CustomIcons.ttf
```

## Common Use Cases

### Loading Images

```dart
// Local asset
Image.asset('assets/images/my_image.png')

// With specific size
Image.asset(
  'assets/images/my_image.png',
  width: 100,
  height: 100,
  fit: BoxFit.cover,
)

// Network image with placeholder
CachedNetworkImage(
  imageUrl: imageUrl,
  placeholder: (context, url) =>
    Image.asset('assets/images/placeholder.png'),
  errorWidget: (context, url, error) =>
    Image.asset('assets/images/no_image.png'),
)
```

### Using SVG Icons

```dart
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture.asset(
  'assets/icons/my_icon.svg',
  width: 24,
  height: 24,
  color: Colors.blue,
)
```

### Circle Avatar with Placeholder

```dart
CircleAvatar(
  radius: 30,
  backgroundImage: user.photoUrl != null
    ? NetworkImage(user.photoUrl!)
    : AssetImage('assets/images/placeholder_user.png') as ImageProvider,
)
```

### Background Image

```dart
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/background.png'),
      fit: BoxFit.cover,
    ),
  ),
  child: YourContent(),
)
```

## Image Optimization

### Before Adding Images

1. **Resize** to appropriate dimensions
2. **Compress** using tools like:
   - [TinyPNG](https://tinypng.com/)
   - [Squoosh](https://squoosh.app/)
   - [ImageOptim](https://imageoptim.com/) (Mac)

3. **Format**:
   - PNG for transparency, icons, logos
   - JPEG for photos, backgrounds
   - SVG for scalable icons
   - WebP for best compression (modern browsers)

### Multiple Resolutions

For high-quality images on different screens:

```
assets/images/logo.png
assets/images/2.0x/logo.png
assets/images/3.0x/logo.png
```

Flutter automatically picks the right resolution.

## Asset Checklist

Before deploying, ensure you have:

- [ ] University/College logo
- [ ] App icon (512x512)
- [ ] Placeholder images (user, news, events)
- [ ] Empty state illustrations
- [ ] Web PWA icons (192x192, 512x512)
- [ ] Favicon for web
- [ ] Platform-specific app icons generated
- [ ] All images optimized

## Troubleshooting

### "Unable to load asset"

**Solutions:**
1. Check file path is correct (case-sensitive)
2. Ensure asset is listed in `pubspec.yaml`
3. Run `flutter pub get` after adding to pubspec
4. Run `flutter clean` and rebuild
5. Check file actually exists in directory

### Images Not Showing

**Solutions:**
1. Verify image format is supported
2. Check image file isn't corrupted
3. Ensure image size isn't too large
4. Try absolute path for testing

### Assets Increasing App Size

**Solutions:**
1. Compress images before adding
2. Use WebP format
3. Use SVG for icons instead of PNG
4. Remove unused assets
5. Use network images when possible

## Best Practices

1. ✅ **Organize by type** - Keep images, icons, logos separate
2. ✅ **Use descriptive names** - `news_placeholder.png` not `img1.png`
3. ✅ **Optimize before adding** - Compress all images
4. ✅ **Provide placeholders** - Better UX during loading
5. ✅ **Use SVG when possible** - Scalable and small file size
6. ✅ **Test on all platforms** - Ensure assets load correctly
7. ✅ **Version control** - Commit assets with meaningful messages
8. ✅ **Document usage** - Add README for custom assets

## Resources

- **Detailed Guidelines**: Check README.md files in each asset directory
- **Flutter Assets Docs**: https://docs.flutter.dev/development/ui/assets-and-images
- **Icon Generator**: https://pub.dev/packages/flutter_launcher_icons
- **Image Optimization**: https://tinypng.com/

## Need Help?

Each asset directory has a detailed README:
- `assets/images/README.md` - Image specifications
- `assets/icons/README.md` - Icon guidelines
- `assets/logos/README.md` - Logo requirements
- `assets/fonts/README.md` - Font configuration
- `web/icons/README.md` - Web PWA icons

## Next Steps

1. Add your university logo to `assets/logos/`
2. Generate app icons using flutter_launcher_icons
3. Add placeholder images for better UX
4. Test on all target platforms
5. Optimize and compress all assets
6. Deploy your app!
