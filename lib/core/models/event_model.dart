import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/enums.dart';

class EventModel {
  final String id;
  final String title;
  final String description;
  final String organizerId;
  final String organizerName;
  final DateTime startDate;
  final DateTime endDate;
  final String venue;
  final int capacity;
  final bool rsvpEnabled;
  final AudienceType audienceType;
  final List<String> targetAudience;
  final List<String> imageUrls;
  final List<String> tags;
  final WorkflowState status;
  final String? rejectionReason;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int attendeeCount;
  final int waitlistCount;
  final bool hasWaitlist;
  final String? qrCode;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.organizerId,
    required this.organizerName,
    required this.startDate,
    required this.endDate,
    required this.venue,
    this.capacity = 0,
    this.rsvpEnabled = true,
    required this.audienceType,
    this.targetAudience = const [],
    this.imageUrls = const [],
    this.tags = const [],
    this.status = WorkflowState.draft,
    this.rejectionReason,
    required this.createdAt,
    this.updatedAt,
    this.attendeeCount = 0,
    this.waitlistCount = 0,
    this.hasWaitlist = true,
    this.qrCode,
  });

  bool get isUpcoming => startDate.isAfter(DateTime.now());
  bool get isOngoing =>
      DateTime.now().isAfter(startDate) && DateTime.now().isBefore(endDate);
  bool get isCompleted => DateTime.now().isAfter(endDate);
  bool get isFull => capacity > 0 && attendeeCount >= capacity;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'organizerId': organizerId,
      'organizerName': organizerName,
      'startDate': Timestamp.fromDate(startDate),
      'endDate': Timestamp.fromDate(endDate),
      'venue': venue,
      'capacity': capacity,
      'rsvpEnabled': rsvpEnabled,
      'audienceType': audienceType.name,
      'targetAudience': targetAudience,
      'imageUrls': imageUrls,
      'tags': tags,
      'status': status.name,
      'rejectionReason': rejectionReason,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'attendeeCount': attendeeCount,
      'waitlistCount': waitlistCount,
      'hasWaitlist': hasWaitlist,
      'qrCode': qrCode,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      organizerId: map['organizerId'] ?? '',
      organizerName: map['organizerName'] ?? '',
      startDate: (map['startDate'] as Timestamp).toDate(),
      endDate: (map['endDate'] as Timestamp).toDate(),
      venue: map['venue'] ?? '',
      capacity: map['capacity'] ?? 0,
      rsvpEnabled: map['rsvpEnabled'] ?? true,
      audienceType: AudienceType.values.firstWhere(
        (a) => a.name == map['audienceType'],
        orElse: () => AudienceType.global,
      ),
      targetAudience: map['targetAudience'] != null
          ? List<String>.from(map['targetAudience'])
          : [],
      imageUrls: map['imageUrls'] != null
          ? List<String>.from(map['imageUrls'])
          : [],
      tags: map['tags'] != null ? List<String>.from(map['tags']) : [],
      status: WorkflowState.values.firstWhere(
        (s) => s.name == map['status'],
        orElse: () => WorkflowState.draft,
      ),
      rejectionReason: map['rejectionReason'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
      attendeeCount: map['attendeeCount'] ?? 0,
      waitlistCount: map['waitlistCount'] ?? 0,
      hasWaitlist: map['hasWaitlist'] ?? true,
      qrCode: map['qrCode'],
    );
  }

  EventModel copyWith({
    String? id,
    String? title,
    String? description,
    String? organizerId,
    String? organizerName,
    DateTime? startDate,
    DateTime? endDate,
    String? venue,
    int? capacity,
    bool? rsvpEnabled,
    AudienceType? audienceType,
    List<String>? targetAudience,
    List<String>? imageUrls,
    List<String>? tags,
    WorkflowState? status,
    String? rejectionReason,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? attendeeCount,
    int? waitlistCount,
    bool? hasWaitlist,
    String? qrCode,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      organizerId: organizerId ?? this.organizerId,
      organizerName: organizerName ?? this.organizerName,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      venue: venue ?? this.venue,
      capacity: capacity ?? this.capacity,
      rsvpEnabled: rsvpEnabled ?? this.rsvpEnabled,
      audienceType: audienceType ?? this.audienceType,
      targetAudience: targetAudience ?? this.targetAudience,
      imageUrls: imageUrls ?? this.imageUrls,
      tags: tags ?? this.tags,
      status: status ?? this.status,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      attendeeCount: attendeeCount ?? this.attendeeCount,
      waitlistCount: waitlistCount ?? this.waitlistCount,
      hasWaitlist: hasWaitlist ?? this.hasWaitlist,
      qrCode: qrCode ?? this.qrCode,
    );
  }
}

class EventRsvp {
  final String id;
  final String eventId;
  final String userId;
  final String userName;
  final RsvpStatus status;
  final DateTime rsvpDate;
  final DateTime? attendedAt;
  final String? notes;

  EventRsvp({
    required this.id,
    required this.eventId,
    required this.userId,
    required this.userName,
    required this.status,
    required this.rsvpDate,
    this.attendedAt,
    this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'eventId': eventId,
      'userId': userId,
      'userName': userName,
      'status': status.name,
      'rsvpDate': Timestamp.fromDate(rsvpDate),
      'attendedAt': attendedAt != null ? Timestamp.fromDate(attendedAt!) : null,
      'notes': notes,
    };
  }

  factory EventRsvp.fromMap(Map<String, dynamic> map) {
    return EventRsvp(
      id: map['id'] ?? '',
      eventId: map['eventId'] ?? '',
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      status: RsvpStatus.values.firstWhere(
        (s) => s.name == map['status'],
        orElse: () => RsvpStatus.pending,
      ),
      rsvpDate: (map['rsvpDate'] as Timestamp).toDate(),
      attendedAt: map['attendedAt'] != null
          ? (map['attendedAt'] as Timestamp).toDate()
          : null,
      notes: map['notes'],
    );
  }
}
