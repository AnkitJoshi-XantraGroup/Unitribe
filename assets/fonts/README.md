# Fonts Directory

This directory contains custom fonts used in the app.

## Current Font Setup

The app currently uses **Google Fonts** (Inter font family), which are automatically downloaded by the `google_fonts` package. No font files are needed in this directory for the default setup.

## Custom Fonts (Optional)

If you want to use custom fonts instead of Google Fonts:

### 1. Add Font Files

Place your font files here:
- `CustomFont-Regular.ttf`
- `CustomFont-Bold.ttf`
- `CustomFont-Italic.ttf`
- `CustomFont-BoldItalic.ttf`

### 2. Update pubspec.yaml

```yaml
flutter:
  fonts:
    - family: CustomFont
      fonts:
        - asset: assets/fonts/CustomFont-Regular.ttf
          weight: 400
        - asset: assets/fonts/CustomFont-Bold.ttf
          weight: 700
        - asset: assets/fonts/CustomFont-Italic.ttf
          style: italic
        - asset: assets/fonts/CustomFont-BoldItalic.ttf
          weight: 700
          style: italic
```

### 3. Update Theme

In `lib/core/theme/app_theme.dart`, replace Google Fonts with custom font:

```dart
textTheme: TextTheme(
  displayLarge: TextStyle(
    fontFamily: 'CustomFont',
    fontSize: 57,
    fontWeight: FontWeight.bold,
  ),
  // ... rest of text styles
)
```

## Custom Icon Fonts

You can also create custom icon fonts using tools like [IcoMoon](https://icomoon.io/):

1. Generate icon font from SVG icons
2. Place `CustomIcons.ttf` in this directory
3. Update `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: CustomIcons
      fonts:
        - asset: assets/fonts/CustomIcons.ttf
```

4. Generate Dart class:

```dart
class CustomIcons {
  static const IconData news = IconData(0xe900, fontFamily: 'CustomIcons');
  static const IconData attendance = IconData(0xe901, fontFamily: 'CustomIcons');
  // ... more icons
}
```

5. Use in code:

```dart
Icon(CustomIcons.news, size: 24)
```

## Recommended Fonts

### For University Apps

1. **Inter** (Current) - Modern, clean, excellent readability
2. **Roboto** - Google's standard, professional
3. **Open Sans** - Friendly and approachable
4. **Poppins** - Modern with geometric style
5. **Lato** - Warm and professional
6. **Montserrat** - Bold and contemporary

### Download Sources

- [Google Fonts](https://fonts.google.com/)
- [Adobe Fonts](https://fonts.adobe.com/)
- [Font Squirrel](https://www.fontsquirrel.com/)

## Font Guidelines

- **Readability:** Choose fonts optimized for screen reading
- **Licensing:** Ensure fonts have appropriate licenses for commercial use
- **Performance:** Limit to 2-3 font families to reduce app size
- **Accessibility:** Maintain good contrast and minimum font sizes
- **File Size:** Optimize font files (subset if needed)

## Current Implementation

The app uses Google Fonts with the Inter family:

```dart
import 'package:google_fonts/google_fonts.dart';

textTheme: GoogleFonts.interTextTheme()
```

Benefits:
- ✅ Automatically cached
- ✅ Easy to switch fonts
- ✅ No manual font file management
- ✅ Supports all font weights and styles
- ✅ Works on all platforms

To change the font, simply update:
```dart
GoogleFonts.robotoTextTheme() // or any other Google Font
```
