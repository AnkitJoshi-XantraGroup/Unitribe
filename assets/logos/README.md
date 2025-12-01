# Logos Directory

This directory contains logos and branding assets for the app.

## Required Logo Files

### App Logo
- `app_logo.png` - Main app logo (512x512px)
- `app_logo_white.png` - White version for dark backgrounds
- `app_logo_horizontal.png` - Horizontal lockup with text
- `app_logo_transparent.png` - Logo with transparent background

### University/College Logo
- `university_logo.png` - Your institution's logo
- `university_logo_white.png` - White version
- `university_seal.png` - Official seal/emblem

### Partner/Vendor Logos
- `partner_logo_1.png` - Partner organization logo
- `partner_logo_2.png` - Additional partner logo

### App Icon Variants
- `icon_192.png` - For web manifest (192x192px)
- `icon_512.png` - For web manifest (512x512px)
- `icon_maskable_192.png` - Maskable icon (192x192px)
- `icon_maskable_512.png` - Maskable icon (512x512px)

### Splash Screen
- `splash_logo.png` - Logo for splash screen (1024x1024px)
- `splash_background.png` - Splash screen background

### Platform-Specific Icons

#### Android
Place in appropriate directories:
- `android/app/src/main/res/mipmap-hdpi/ic_launcher.png` (72x72px)
- `android/app/src/main/res/mipmap-mdpi/ic_launcher.png` (48x48px)
- `android/app/src/main/res/mipmap-xhdpi/ic_launcher.png` (96x96px)
- `android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png` (144x144px)
- `android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png` (192x192px)

#### iOS
Place in Xcode Assets catalog:
- `ios/Runner/Assets.xcassets/AppIcon.appiconset/`

#### Web
Already configured in `web/manifest.json` - copy icons to `web/icons/`

## Logo Guidelines

- **Format:** PNG with transparency
- **Background:** Transparent for versatility
- **Padding:** Include safe area padding for app icons
- **Aspect Ratio:** Square for app icons, flexible for horizontal lockups
- **Versions:** Provide both colored and white versions
- **Quality:** High resolution for scaling

## Usage in Code

```dart
// Main app logo
Image.asset('assets/logos/app_logo.png', height: 120)

// University logo
Image.asset('assets/logos/university_logo.png', height: 60)

// Splash screen
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/logos/splash_logo.png'),
    ),
  ),
)
```

## Generating App Icons

Use tools to generate platform-specific icons:
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
- [App Icon Generator](https://appicon.co/)
- [Figma Icon Export](https://www.figma.com/)

### Using flutter_launcher_icons

1. Add to `pubspec.yaml`:
```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/logos/app_logo.png"
  adaptive_icon_background: "#6366F1"
  adaptive_icon_foreground: "assets/logos/app_logo.png"
```

2. Run:
```bash
flutter pub run flutter_launcher_icons
```

## Branding

- **Primary Color:** #6366F1 (Indigo)
- **Secondary Color:** #8B5CF6 (Purple)
- **App Name:** UniTribe
- **Tagline:** Your Campus, Connected
