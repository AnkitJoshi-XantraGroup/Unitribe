# UniTribe Setup Guide

This guide will walk you through setting up the UniTribe application from scratch.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (3.0 or higher) - [Install Flutter](https://docs.flutter.dev/get-started/install)
- **Git** - [Install Git](https://git-scm.com/downloads)
- **Firebase Account** - [Create Firebase Account](https://firebase.google.com/)
- **Android Studio** (for Android development)
- **Xcode** (for iOS development, macOS only)
- **Visual Studio** (for Windows development)

## Step 1: Clone the Repository

```bash
git clone <your-repository-url>
cd Unitribe
```

## Step 2: Install Flutter Dependencies

```bash
flutter pub get
```

## Step 3: Firebase Setup

### 3.1 Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project" or "Create a project"
3. Enter project name: `UniTribe` (or your preferred name)
4. Enable Google Analytics (optional but recommended)
5. Click "Create project"

### 3.2 Enable Firebase Services

#### Authentication

1. In Firebase Console, go to **Build** > **Authentication**
2. Click "Get started"
3. Enable **Email/Password** sign-in method
4. (Optional) Enable other sign-in methods as needed

#### Cloud Firestore

1. Go to **Build** > **Firestore Database**
2. Click "Create database"
3. Choose **Start in production mode** (we'll add rules later)
4. Select a location closest to your users
5. Click "Enable"

#### Cloud Storage

1. Go to **Build** > **Storage**
2. Click "Get started"
3. Choose **Start in production mode**
4. Select the same location as Firestore
5. Click "Done"

#### Cloud Messaging (for push notifications)

1. Go to **Build** > **Cloud Messaging**
2. The service is automatically enabled

#### Analytics

1. Go to **Build** > **Analytics**
2. Enable Google Analytics if you haven't already

### 3.3 Configure Firebase for Flutter

1. Install FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   ```

2. Configure Firebase for your project:
   ```bash
   flutterfire configure
   ```

3. Select your Firebase project from the list
4. Select the platforms you want to support:
   - ✅ Android
   - ✅ iOS
   - ✅ Web
   - ✅ Windows

5. This will generate `lib/firebase_options.dart` with your configuration

### 3.4 Deploy Firestore Security Rules

1. Install Firebase CLI:
   ```bash
   npm install -g firebase-tools
   ```

2. Login to Firebase:
   ```bash
   firebase login
   ```

3. Initialize Firebase in your project:
   ```bash
   firebase init
   ```
   - Select **Firestore** and **Storage**
   - Use existing project (select your UniTribe project)
   - Accept default Firestore rules file: `firestore.rules`
   - Accept default Firestore indexes file: `firestore.indexes.json`
   - Accept default Storage rules file: `storage.rules`

4. Deploy the rules:
   ```bash
   firebase deploy --only firestore:rules
   firebase deploy --only storage:rules
   ```

### 3.5 Create Initial Firestore Collections

You can create these collections manually in the Firebase Console or they will be created automatically when the app first runs:

- `users` - User profiles
- `news` - News articles
- `attendance` - Attendance records
- `timetable` - Timetable entries
- `clubs` - Club information
- `club_memberships` - Club membership data
- `events` - Events
- `event_rsvps` - Event RSVP data
- `vendor_offers` - Vendor promotional offers
- `classes` - Class/Course information
- `departments` - Department information
- `notifications` - User notifications
- `audit_logs` - Audit trail logs

## Step 4: Platform-Specific Setup

### Android Setup

1. Open `android/app/build.gradle`
2. Ensure minimum SDK version is 21 or higher:
   ```gradle
   minSdkVersion 21
   ```

3. Download `google-services.json` from Firebase Console:
   - Go to Project Settings > General
   - Under "Your apps", select Android app
   - Download `google-services.json`
   - Place it in `android/app/`

### iOS Setup

1. Open Xcode: `open ios/Runner.xcworkspace`
2. Set minimum deployment target to iOS 12.0 or higher

3. Download `GoogleService-Info.plist`:
   - Go to Firebase Console > Project Settings > General
   - Under "Your apps", select iOS app
   - Download `GoogleService-Info.plist`
   - Drag it into `ios/Runner/` in Xcode

4. Update `ios/Runner/Info.plist` for permissions:
   ```xml
   <key>NSCameraUsageDescription</key>
   <string>We need camera access for profile photos and QR scanning</string>
   <key>NSPhotoLibraryUsageDescription</key>
   <string>We need photo library access to upload images</string>
   ```

### Web Setup

1. Update `web/index.html` with Firebase config (already done by flutterfire configure)

2. For Firebase Hosting (optional):
   ```bash
   firebase init hosting
   ```
   - Build directory: `build/web`
   - Configure as single-page app: Yes
   - Set up automatic builds with GitHub: Optional

3. Deploy to Firebase Hosting:
   ```bash
   flutter build web --release
   firebase deploy --only hosting
   ```

### Windows Setup

Windows support should work out of the box with the Flutter Windows desktop support.

## Step 5: Running the App

### Mobile (Android/iOS)

```bash
# List available devices
flutter devices

# Run on connected device
flutter run

# Run in debug mode with hot reload
flutter run --debug

# Run in release mode
flutter run --release
```

### Web

```bash
# Run in Chrome
flutter run -d chrome

# Run in Edge
flutter run -d edge

# Build for production
flutter build web --release
```

### Windows

```bash
# Run on Windows
flutter run -d windows

# Build for production
flutter build windows --release
```

## Step 6: Create Initial Admin User

Since all users need approval workflows, you'll need to create an initial administrator account manually in Firestore:

1. Create a user via the signup flow
2. Go to Firebase Console > Firestore Database
3. Find your user document in the `users` collection
4. Edit the document and change `role` to `administrator`
5. Set `isActive` to `true`

Alternatively, you can create a script to seed the database with initial data.

## Step 7: Testing

### Unit Tests

```bash
flutter test
```

### Integration Tests

```bash
flutter test integration_test
```

## Common Issues and Solutions

### Issue: Firebase initialization error

**Solution**: Ensure you've run `flutterfire configure` and all Firebase services are enabled.

### Issue: Build fails on iOS

**Solution**:
- Run `pod install` in the `ios/` directory
- Clean build folder in Xcode
- Ensure Xcode is up to date

### Issue: Web app not loading

**Solution**:
- Check browser console for errors
- Ensure Firebase Hosting rules allow your domain
- Clear browser cache

### Issue: Windows build fails

**Solution**:
- Ensure Visual Studio with C++ development tools is installed
- Run `flutter doctor` to check for issues

## Development Tips

1. **Hot Reload**: Use `r` in the terminal while running to hot reload
2. **Hot Restart**: Use `R` for hot restart
3. **Debugging**: Use Flutter DevTools for debugging and performance profiling
4. **State Management**: The app uses Riverpod - familiarize yourself with it

## Additional Configuration

### Push Notifications

For push notifications to work:

1. **Android**:
   - Download `google-services.json` (already done)
   - FCM should work automatically

2. **iOS**:
   - Upload APNs certificate to Firebase Console
   - Enable Push Notifications capability in Xcode

3. **Web**:
   - Generate Web Push certificates in Firebase Console
   - Update `firebase-messaging-sw.js`

### Analytics

Analytics should start working automatically once the app is running.

### Offline Support

The app uses Firebase's offline persistence for Firestore. Enable it in settings if needed.

## Deployment

### Google Play Store (Android)

1. Create app signing key
2. Update `android/app/build.gradle` with signing config
3. Build release APK or App Bundle:
   ```bash
   flutter build appbundle --release
   ```
4. Upload to Google Play Console

### Apple App Store (iOS)

1. Create App ID in Apple Developer Console
2. Configure provisioning profiles
3. Build for release:
   ```bash
   flutter build ios --release
   ```
4. Archive and upload via Xcode

### Web Deployment

```bash
flutter build web --release
firebase deploy --only hosting
```

### Windows Distribution

Build the Windows executable:
```bash
flutter build windows --release
```

The executable will be in `build/windows/runner/Release/`

## Next Steps

1. Customize the theme in `lib/core/theme/`
2. Add your university logo to `assets/logos/`
3. Implement feature screens in `lib/features/`
4. Add your custom business logic
5. Test thoroughly on all platforms
6. Deploy to production

## Support

For issues or questions:
- Check the [README.md](README.md)
- Open an issue on GitHub
- Contact support team

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Riverpod Documentation](https://riverpod.dev/)
- [GoRouter Documentation](https://pub.dev/packages/go_router)

---

Happy coding! 🎉
