# Images Directory

This directory contains general images used throughout the app.

## Recommended Images

### Placeholder Images
- `placeholder_user.png` - Default user avatar (512x512px)
- `placeholder_news.png` - News article placeholder (1200x630px)
- `placeholder_event.png` - Event placeholder (1200x630px)
- `placeholder_club.png` - Club placeholder (800x800px)
- `no_image.png` - Generic "no image" placeholder (400x400px)

### Feature-Specific Images
- `empty_state_news.png` - Empty state for news feed
- `empty_state_events.png` - Empty state for events
- `empty_state_clubs.png` - Empty state for clubs
- `empty_state_attendance.png` - Empty state for attendance
- `empty_state_notifications.png` - Empty state for notifications

### Onboarding/Welcome
- `onboarding_1.png` - First onboarding screen
- `onboarding_2.png` - Second onboarding screen
- `onboarding_3.png` - Third onboarding screen

### Backgrounds
- `gradient_bg.png` - Gradient background
- `pattern_bg.png` - Pattern background

## Image Guidelines

- **Format:** PNG with transparency or JPEG
- **Optimization:** Compress images for web/mobile
- **Naming:** Use lowercase with underscores (snake_case)
- **Sizes:** Provide @2x and @3x versions for retina displays

## Usage in Code

```dart
Image.asset('assets/images/placeholder_user.png')
```
