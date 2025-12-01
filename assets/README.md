# Assets Directory

This directory contains all static assets used in the UniTribe application.

## Directory Structure

```
assets/
├── images/          # General images (backgrounds, placeholders, etc.)
├── icons/           # Custom icons and feature icons
├── logos/           # App logo, university logo, branding
└── fonts/           # Custom fonts (optional - currently using Google Fonts)
```

## Quick Reference

### Images (`images/`)
- General purpose images
- Placeholder images
- Empty state illustrations
- Onboarding screens
- Background images

**See:** `images/README.md` for detailed guidelines

### Icons (`icons/`)
- Feature-specific icons
- Action icons (add, edit, delete)
- Status indicators
- Role badges
- Custom UI elements

**See:** `icons/README.md` for detailed guidelines

### Logos (`logos/`)
- App logo and branding
- University/College logo
- Partner logos
- Platform-specific app icons
- Splash screen assets

**See:** `logos/README.md` for detailed guidelines

### Fonts (`fonts/`)
- Custom font files (if not using Google Fonts)
- Custom icon fonts
- Typography assets

**See:** `fonts/README.md` for detailed guidelines

## Current Setup

The app is configured to use assets via `pubspec.yaml`:

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

## Adding Assets

### 1. Place Files in Appropriate Directory

```
assets/images/my_image.png
assets/icons/my_icon.svg
assets/logos/app_logo.png
```

### 2. Use in Code

```dart
// Images
Image.asset('assets/images/my_image.png')

// SVG Icons
import 'package:flutter_svg/flutter_svg.dart';
SvgPicture.asset('assets/icons/my_icon.svg')

// Network images with cached_network_image
CachedNetworkImage(
  imageUrl: url,
  placeholder: (context, url) => Image.asset('assets/images/placeholder.png'),
)
```

## Asset Optimization

### Image Optimization
- Use PNG for images requiring transparency
- Use JPEG for photos
- Compress images before adding to project
- Tools: TinyPNG, ImageOptim, Squoosh

### Icon Optimization
- Use SVG for scalable icons
- Keep PNG icons small (24x24, 48x48)
- Use icon fonts for frequently used icons

### Performance Tips
- Lazy load large images
- Use `precacheImage()` for important images
- Provide multiple resolutions (@2x, @3x)
- Consider using vector graphics (SVG) when possible

## Asset Generation Tools

### App Icons
```bash
# Using flutter_launcher_icons
flutter pub run flutter_launcher_icons
```

### Splash Screens
```bash
# Using flutter_native_splash
flutter pub run flutter_native_splash:create
```

## Platform-Specific Assets

### Android
- App icons: `android/app/src/main/res/mipmap-*/`
- Splash: `android/app/src/main/res/drawable/`

### iOS
- App icons: `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
- Splash: `ios/Runner/Assets.xcassets/LaunchImage.launchimage/`

### Web
- Favicon: `web/favicon.png`
- Icons: `web/icons/`
- Manifest: `web/manifest.json`

## File Naming Conventions

- Use lowercase
- Use underscores for spaces: `my_image.png`
- Be descriptive: `news_placeholder.png` not `img1.png`
- Include size if multiple versions: `logo_small.png`, `logo_large.png`

## Asset Sizes

### App Icons
- Android: 48dp to 192dp (provide all densities)
- iOS: 20pt to 1024pt (provide all sizes)
- Web: 192x192, 512x512

### Images
- Thumbnails: 150x150 to 300x300
- Cards: 400x300 to 800x600
- Headers: 1200x400 to 1920x600
- Full screen: Match device resolution

### Icons
- Small: 16x16 to 24x24
- Medium: 32x32 to 48x48
- Large: 64x64 to 96x96

## Getting Started

1. **Add your university logo:**
   ```
   assets/logos/university_logo.png
   ```

2. **Add app icon:**
   ```
   assets/logos/app_logo.png (512x512)
   ```

3. **Generate platform icons:**
   ```bash
   flutter pub run flutter_launcher_icons
   ```

4. **Add placeholder images:**
   ```
   assets/images/placeholder_user.png
   assets/images/placeholder_news.png
   ```

5. **Test assets:**
   ```bash
   flutter run
   ```

## Troubleshooting

### Asset not found
- Check file path is correct
- Ensure asset is listed in `pubspec.yaml`
- Run `flutter pub get` after adding assets
- Check file name case sensitivity

### Image not displaying
- Verify file format is supported (PNG, JPEG, GIF, WebP)
- Check file is not corrupted
- Ensure sufficient permissions
- Clear build cache: `flutter clean`

## Resources

- [Flutter Assets Documentation](https://docs.flutter.dev/development/ui/assets-and-images)
- [Material Design Icons](https://fonts.google.com/icons)
- [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons)
- [Image Optimization Tools](https://tinypng.com/)

## Support

For asset-related issues, check:
1. File exists in correct directory
2. Path is correct in code
3. Asset declared in pubspec.yaml
4. Flutter project is rebuilt after changes
