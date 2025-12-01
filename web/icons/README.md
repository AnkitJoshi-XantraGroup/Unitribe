# Web Icons

This directory contains icons for the web version of the app.

## Required Icons

For Progressive Web App (PWA) support, you need:

1. **Icon-192.png** (192x192px)
   - Used on mobile home screens
   - Standard PWA icon size

2. **Icon-512.png** (512x512px)
   - Used for splash screens
   - Required for PWA installation

3. **Icon-maskable-192.png** (192x192px)
   - Maskable icon for adaptive icons
   - Safe zone: center 80% of image

4. **Icon-maskable-512.png** (512x512px)
   - Large maskable icon
   - Safe zone: center 80% of image

## Maskable Icons

Maskable icons allow your icon to look great on all platforms with different icon shapes.

### Design Guidelines
- Place important content in the center 80% (safe zone)
- Use a solid background color that extends to edges
- Icon should work when cropped to circle, rounded square, or squircle

### Testing
Test your maskable icons at: https://maskable.app/editor

## Favicon

Place `favicon.png` in the `web/` directory (parent directory).

Recommended sizes:
- 16x16px
- 32x32px
- 48x48px
- 64x64px

## Generating Icons

### Using Image Editor
1. Create your icon at 512x512px
2. Export at 192x192 and 512x512
3. For maskable: Add padding and background

### Using Online Tools
- [PWA Asset Generator](https://www.pwabuilder.com/)
- [Real Favicon Generator](https://realfavicongenerator.net/)
- [Maskable Icon Editor](https://maskable.app/editor)

### Using Flutter Launcher Icons
Add to `pubspec.yaml`:
```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_launcher_icons:
  web:
    generate: true
    image_path: "assets/logos/app_logo.png"
    background_color: "#6366F1"
    theme_color: "#6366F1"
```

Run:
```bash
flutter pub run flutter_launcher_icons
```

## Current Configuration

These icons are referenced in `web/manifest.json`:

```json
{
  "icons": [
    {
      "src": "icons/Icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "icons/Icon-512.png",
      "sizes": "512x512",
      "type": "image/png"
    },
    {
      "src": "icons/Icon-maskable-192.png",
      "sizes": "192x192",
      "type": "image/png",
      "purpose": "maskable"
    },
    {
      "src": "icons/Icon-maskable-512.png",
      "sizes": "512x512",
      "type": "image/png",
      "purpose": "maskable"
    }
  ]
}
```

## Deployment

After adding icons:
1. Build the web app: `flutter build web`
2. Test locally: `flutter run -d chrome`
3. Deploy to Firebase Hosting or your web server

The icons will be used when users:
- Add app to home screen
- Install as PWA
- See app in browser tabs
