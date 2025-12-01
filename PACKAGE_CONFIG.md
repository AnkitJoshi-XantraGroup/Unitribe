# Package Configuration

This document outlines the package name configuration for the UniTribe application across all platforms.

## Package Name

**Package/Bundle Identifier:** `com.xantra.unitribe`

## Platform-Specific Configuration

### Android

- **Package Name:** `com.xantra.unitribe`
- **Location:** `android/app/build.gradle`
- **Configuration:**
  ```gradle
  android {
      namespace "com.xantra.unitribe"
      defaultConfig {
          applicationId "com.xantra.unitribe"
      }
  }
  ```

- **Main Activity:** `android/app/src/main/kotlin/com/xantra/unitribe/MainActivity.kt`
- **Manifest:** `android/app/src/main/AndroidManifest.xml`

### iOS

- **Bundle Identifier:** `com.xantra.unitribe`
- **Location:** Set in Xcode project settings
- **Configuration Steps:**
  1. Open `ios/Runner.xcworkspace` in Xcode
  2. Select the Runner project in the left sidebar
  3. Select the Runner target
  4. Go to the "General" tab
  5. Set "Bundle Identifier" to: `com.xantra.unitribe`

- **Info.plist:** `ios/Runner/Info.plist`

### Web

- **App Name:** UniTribe
- **Configuration:** `web/manifest.json`
- **URL:** Will be determined by Firebase Hosting or your domain

### Windows

- **Binary Name:** `unitribe`
- **Location:** `windows/CMakeLists.txt`
- **Publisher:** Xantra

### macOS

- **Bundle Identifier:** `com.xantra.unitribe`
- **Configuration:** Set in Xcode project settings (similar to iOS)

## Firebase Configuration

When running `flutterfire configure`, ensure you select the package name `com.xantra.unitribe` for all platforms.

### Android Firebase Setup

1. In Firebase Console, go to Project Settings
2. Under "Your apps", click "Add app" → Android
3. Enter package name: `com.xantra.unitribe`
4. Download `google-services.json`
5. Place in `android/app/google-services.json`

### iOS Firebase Setup

1. In Firebase Console, go to Project Settings
2. Under "Your apps", click "Add app" → iOS
3. Enter bundle ID: `com.xantra.unitribe`
4. Download `GoogleService-Info.plist`
5. Add to Xcode project in `ios/Runner/`

### Web Firebase Setup

1. In Firebase Console, go to Project Settings
2. Under "Your apps", click "Add app" → Web
3. Register app with name "UniTribe Web"
4. Copy Firebase configuration (already in `firebase_options.dart`)

## App Store / Play Store Configuration

### Google Play Console

- **Package Name:** `com.xantra.unitribe`
- **App Name:** UniTribe
- **Developer:** Xantra

### Apple App Store

- **Bundle ID:** `com.xantra.unitribe`
- **App Name:** UniTribe
- **Team:** Xantra

## Important Notes

1. The package name `com.xantra.unitribe` must be consistent across all platforms
2. Once published to app stores, the package name **cannot be changed**
3. For development builds, you can use different package names if needed
4. Ensure Firebase configuration matches the package name for each platform

## Verification

To verify the package name is correctly configured:

### Android
```bash
grep -r "com.xantra.unitribe" android/
```

### iOS
Open Xcode and check the Bundle Identifier in project settings

### Flutter
The package name is set per platform and doesn't affect the Flutter code directly

## Support

If you need to change the package name, you'll need to:
1. Update all configuration files mentioned above
2. Re-run `flutterfire configure`
3. Update Firebase app configurations
4. Clean and rebuild the project
