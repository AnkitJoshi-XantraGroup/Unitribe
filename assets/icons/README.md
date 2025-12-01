# Icons Directory

This directory contains custom icons used throughout the app.

## Recommended Icons

### Feature Icons
- `news_icon.png` - News feature icon
- `attendance_icon.png` - Attendance feature icon
- `timetable_icon.png` - Timetable feature icon
- `clubs_icon.png` - Clubs feature icon
- `events_icon.png` - Events feature icon
- `vendor_icon.png` - Vendor offers feature icon
- `profile_icon.png` - Profile feature icon

### Action Icons
- `add_icon.png` - Add/Create action
- `edit_icon.png` - Edit action
- `delete_icon.png` - Delete action
- `approve_icon.png` - Approve action
- `reject_icon.png` - Reject action
- `search_icon.png` - Search action

### Status Icons
- `pending_icon.png` - Pending status
- `approved_icon.png` - Approved status
- `rejected_icon.png` - Rejected status
- `draft_icon.png` - Draft status

### Role Icons
- `admin_icon.png` - Administrator role
- `professor_icon.png` - Professor role
- `student_icon.png` - Student role
- `parent_icon.png` - Parent role
- `vendor_icon.png` - Vendor role

### Attendance Icons
- `present_icon.png` - Present status
- `absent_icon.png` - Absent status
- `late_icon.png` - Late status
- `excused_icon.png` - Excused status

## Icon Guidelines

- **Format:** PNG with transparency or SVG
- **Size:** 24x24dp, 48x48dp (provide multiple sizes)
- **Color:** Design icons in single color (can be tinted in code)
- **Style:** Match Material Design icon style
- **Naming:** Use lowercase with underscores (snake_case)

## Usage in Code

```dart
// Using asset image
Image.asset('assets/icons/news_icon.png', width: 24, height: 24)

// Using SVG
SvgPicture.asset('assets/icons/news_icon.svg', width: 24, height: 24)
```

## Alternative

You can also use Material Icons or Font Awesome icons instead of custom assets:

```dart
Icon(Icons.newspaper) // Material Icons
```
