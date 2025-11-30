# UniTribe - University/College Mobile App

A comprehensive university/college mobile application built with Flutter and Firebase, featuring role-based access control, approval workflows, and multi-platform support (Mobile, Web, Windows).

## 📱 Features

### Core Features

1. **Role-Based Access Control (RBAC)**
   - Administrator
   - Professor
   - Student
   - Parent
   - Vendor

2. **News Management**
   - Create, edit, and publish news articles
   - Approval workflow for content
   - Rich text editor with image support
   - Targeted audience (global, department, class, specific users)
   - Comments and reactions

3. **Attendance System**
   - Mark attendance by session
   - Status types: Present, Absent, Late, Excused
   - Attendance summaries and reports
   - Correction requests with approval

4. **Timetable Management**
   - Class-level and personal timetables
   - Versioning and effective date ranges
   - Conflict validation
   - Approval workflow for changes

5. **Clubs Management**
   - Create and manage clubs
   - Membership requests and approvals
   - Club moderators and members
   - Activity feeds and galleries

6. **Events System**
   - Create and publish events
   - RSVP and capacity management
   - Waitlist support
   - QR code check-in
   - Event reminders and notifications

7. **Vendor Offers**
   - Create promotional offers
   - Validity periods and eligibility rules
   - Redemption tracking
   - Approval workflow

8. **Student Class Selection**
   - Select active class
   - Content filtered by selected class
   - Personalized experience

9. **Notifications**
   - Push, In-app, and Email notifications
   - Configurable notification preferences
   - Event reminders and approval updates

10. **Search & Discovery**
    - Search across all content types
    - Advanced filters
    - Tag-based discovery

11. **Audit Logging**
    - Track all create/edit/approve actions
    - Immutable approval logs
    - Exportable audit trails

## 🎨 Design

The app features a modern, professional color scheme designed to appeal to students:

- **Primary Colors**: Indigo (#6366F1) - Trust and wisdom
- **Secondary Colors**: Purple (#8B5CF6) - Creativity
- **Accent Colors**: Emerald Green (#10B981) - Growth and success
- **Additional Accents**: Amber (#F59E0B) - Energy, Pink (#EC4899) - Passion

The design uses Google's Inter font family for excellent readability and modern aesthetics.

## 🏗️ Architecture

### Tech Stack

- **Framework**: Flutter 3.x
- **State Management**: Riverpod 2.x
- **Backend**: Firebase
  - Authentication
  - Cloud Firestore
  - Cloud Storage
  - Cloud Messaging
  - Analytics
- **Routing**: GoRouter
- **Local Storage**: Hive
- **UI Components**: Material Design 3

### Project Structure

```
lib/
├── core/
│   ├── constants/       # Enums, constants
│   ├── models/          # Data models
│   ├── services/        # Core services (auth, navigation)
│   ├── theme/           # App theme and colors
│   └── utils/           # Utility functions
├── features/
│   ├── auth/            # Authentication
│   ├── news/            # News module
│   ├── attendance/      # Attendance module
│   ├── timetable/       # Timetable module
│   ├── clubs/           # Clubs module
│   ├── events/          # Events module
│   ├── vendor_offers/   # Vendor offers module
│   ├── notifications/   # Notifications
│   ├── profile/         # User profiles
│   └── search/          # Search functionality
├── shared/
│   └── widgets/         # Reusable widgets
└── main.dart            # App entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Firebase account
- Android Studio / Xcode (for mobile development)
- Visual Studio (for Windows development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/Unitribe.git
   cd Unitribe
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**

   a. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com)

   b. Enable the following services:
      - Authentication (Email/Password)
      - Cloud Firestore
      - Cloud Storage
      - Cloud Messaging
      - Analytics

   c. Install FlutterFire CLI:
      ```bash
      dart pub global activate flutterfire_cli
      ```

   d. Configure Firebase for your project:
      ```bash
      flutterfire configure
      ```
      This will generate `lib/firebase_options.dart` with your Firebase configuration.

   e. Set up Firestore Security Rules (see `firestore.rules`)

   f. Set up Storage Security Rules (see `storage.rules`)

4. **Run the app**

   For mobile:
   ```bash
   flutter run
   ```

   For web:
   ```bash
   flutter run -d chrome
   ```

   For Windows:
   ```bash
   flutter run -d windows
   ```

### Build for Production

**Android APK:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web --release
```

**Windows:**
```bash
flutter build windows --release
```

## 🔐 Firebase Security Rules

The app uses comprehensive Firestore security rules to enforce role-based access control. See `firestore.rules` for the complete implementation.

### Key Security Features:

- Users can only read/write their own profile data
- Administrators can approve/reject all content
- Professors can create content that requires approval
- Students have read-only access to approved content
- Parents can only view their children's data
- Vendors can only manage their own offers

## 📊 Data Models

### User Model
```dart
{
  id: String
  email: String
  firstName: String
  lastName: String
  role: UserRole (administrator | professor | student | parent | vendor)
  photoUrl: String?
  isActive: bool
  createdAt: DateTime
  // Role-specific fields...
}
```

### News Model
```dart
{
  id: String
  title: String
  body: String
  authorId: String
  audienceType: AudienceType
  targetAudience: List<String>
  status: WorkflowState
  createdAt: DateTime
  publishedAt: DateTime?
  // Additional fields...
}
```

See `lib/core/models/` for all data models.

## 🔄 Approval Workflows

All content created by Professors and Vendors follows an approval workflow:

1. **Draft** → Professor/Vendor creates content
2. **Pending Approval** → Submitted for review
3. **Approved/Published** → Administrator approves
4. **Rejected** → Administrator rejects with reason
5. **Archived** → Content is archived

## 👥 User Roles & Permissions

### Administrator
- Full system access
- Approve/reject all content
- Manage users and roles
- Configure classes and departments
- View all audit logs

### Professor
- Create news, timetables, clubs, events (requires approval)
- Mark attendance for assigned classes
- Manage class-level content
- View own class reports

### Student
- View news, timetable, events, clubs, vendor offers
- Content filtered by selected class
- Join clubs and RSVP to events
- View own attendance

### Parent
- View child's attendance and timetable
- Receive notifications about child's class
- RSVP to events for child

### Vendor
- Create and manage promotional offers
- Track offer performance
- View redemption analytics

## 🎯 Roadmap

- [ ] Implement all feature screens and UI components
- [ ] Add real-time chat/messaging
- [ ] Implement push notifications
- [ ] Add multi-language support
- [ ] Create mobile apps for iOS and Android
- [ ] Deploy web app to Firebase Hosting
- [ ] Add analytics dashboard
- [ ] Implement offline mode
- [ ] Add QR code scanning for events
- [ ] Create admin panel for web

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📧 Support

For support, email support@unitribe.com or open an issue on GitHub.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase team for the backend services
- Google Fonts for the Inter font family
- All contributors and testers

---

**Built with ❤️ using Flutter and Firebase**
