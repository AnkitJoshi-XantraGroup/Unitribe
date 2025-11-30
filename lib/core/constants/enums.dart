/// User roles in the system
enum UserRole {
  administrator,
  professor,
  student,
  parent,
  vendor;

  String get displayName {
    switch (this) {
      case UserRole.administrator:
        return 'Administrator';
      case UserRole.professor:
        return 'Professor';
      case UserRole.student:
        return 'Student';
      case UserRole.parent:
        return 'Parent';
      case UserRole.vendor:
        return 'Vendor';
    }
  }

  String get description {
    switch (this) {
      case UserRole.administrator:
        return 'Central moderation and configuration authority';
      case UserRole.professor:
        return 'Faculty member responsible for academic content';
      case UserRole.student:
        return 'Learner who consumes authorized content';
      case UserRole.parent:
        return 'Guardian associated with students';
      case UserRole.vendor:
        return 'External partner offering campus deals';
    }
  }
}

/// Workflow states for content approval
enum WorkflowState {
  draft,
  pendingApproval,
  approved,
  rejected,
  published,
  archived,
  superseded,
  active,
  inactive,
  expired,
  withdrawn,
  cancelled,
  completed;

  String get displayName {
    switch (this) {
      case WorkflowState.draft:
        return 'Draft';
      case WorkflowState.pendingApproval:
        return 'Pending Approval';
      case WorkflowState.approved:
        return 'Approved';
      case WorkflowState.rejected:
        return 'Rejected';
      case WorkflowState.published:
        return 'Published';
      case WorkflowState.archived:
        return 'Archived';
      case WorkflowState.superseded:
        return 'Superseded';
      case WorkflowState.active:
        return 'Active';
      case WorkflowState.inactive:
        return 'Inactive';
      case WorkflowState.expired:
        return 'Expired';
      case WorkflowState.withdrawn:
        return 'Withdrawn';
      case WorkflowState.cancelled:
        return 'Cancelled';
      case WorkflowState.completed:
        return 'Completed';
    }
  }
}

/// Attendance status types
enum AttendanceStatus {
  present,
  absent,
  late,
  excused;

  String get displayName {
    switch (this) {
      case AttendanceStatus.present:
        return 'Present';
      case AttendanceStatus.absent:
        return 'Absent';
      case AttendanceStatus.late:
        return 'Late';
      case AttendanceStatus.excused:
        return 'Excused';
    }
  }
}

/// Content audience types
enum AudienceType {
  global,
  department,
  classLevel,
  specific;

  String get displayName {
    switch (this) {
      case AudienceType.global:
        return 'All Users';
      case AudienceType.department:
        return 'Department';
      case AudienceType.classLevel:
        return 'Class';
      case AudienceType.specific:
        return 'Specific Users';
    }
  }
}

/// Event RSVP status
enum RsvpStatus {
  pending,
  accepted,
  declined,
  waitlist,
  attended;

  String get displayName {
    switch (this) {
      case RsvpStatus.pending:
        return 'Pending';
      case RsvpStatus.accepted:
        return 'Accepted';
      case RsvpStatus.declined:
        return 'Declined';
      case RsvpStatus.waitlist:
        return 'Waitlist';
      case RsvpStatus.attended:
        return 'Attended';
    }
  }
}

/// Club membership status
enum MembershipStatus {
  pending,
  active,
  inactive,
  removed;

  String get displayName {
    switch (this) {
      case MembershipStatus.pending:
        return 'Pending';
      case MembershipStatus.active:
        return 'Active';
      case MembershipStatus.inactive:
        return 'Inactive';
      case MembershipStatus.removed:
        return 'Removed';
    }
  }
}

/// Notification channels
enum NotificationChannel {
  push,
  inApp,
  email;

  String get displayName {
    switch (this) {
      case NotificationChannel.push:
        return 'Push Notification';
      case NotificationChannel.inApp:
        return 'In-App';
      case NotificationChannel.email:
        return 'Email';
    }
  }
}

/// Notification types
enum NotificationType {
  newsPublished,
  approvalRequest,
  approvalGranted,
  approvalRejected,
  attendanceMarked,
  timetableUpdated,
  clubInvitation,
  clubMembershipApproved,
  eventCreated,
  eventReminder,
  eventCancelled,
  vendorOfferPublished,
  general;

  String get displayName {
    switch (this) {
      case NotificationType.newsPublished:
        return 'News Published';
      case NotificationType.approvalRequest:
        return 'Approval Request';
      case NotificationType.approvalGranted:
        return 'Approved';
      case NotificationType.approvalRejected:
        return 'Rejected';
      case NotificationType.attendanceMarked:
        return 'Attendance Marked';
      case NotificationType.timetableUpdated:
        return 'Timetable Updated';
      case NotificationType.clubInvitation:
        return 'Club Invitation';
      case NotificationType.clubMembershipApproved:
        return 'Club Membership Approved';
      case NotificationType.eventCreated:
        return 'New Event';
      case NotificationType.eventReminder:
        return 'Event Reminder';
      case NotificationType.eventCancelled:
        return 'Event Cancelled';
      case NotificationType.vendorOfferPublished:
        return 'New Vendor Offer';
      case NotificationType.general:
        return 'General';
    }
  }
}
