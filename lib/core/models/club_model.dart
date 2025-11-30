import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/enums.dart';

class ClubModel {
  final String id;
  final String name;
  final String description;
  final String category;
  final String creatorId;
  final String creatorName;
  final List<String> moderatorIds;
  final int capacity;
  final List<String> eligibleClassIds;
  final List<String> imageUrls;
  final WorkflowState status;
  final String? rejectionReason;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int memberCount;
  final bool isPublic;

  ClubModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.creatorId,
    required this.creatorName,
    this.moderatorIds = const [],
    this.capacity = 0,
    this.eligibleClassIds = const [],
    this.imageUrls = const [],
    this.status = WorkflowState.draft,
    this.rejectionReason,
    required this.createdAt,
    this.updatedAt,
    this.memberCount = 0,
    this.isPublic = true,
  });

  bool get isFull => capacity > 0 && memberCount >= capacity;
  bool get isActive => status == WorkflowState.active;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'creatorId': creatorId,
      'creatorName': creatorName,
      'moderatorIds': moderatorIds,
      'capacity': capacity,
      'eligibleClassIds': eligibleClassIds,
      'imageUrls': imageUrls,
      'status': status.name,
      'rejectionReason': rejectionReason,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'memberCount': memberCount,
      'isPublic': isPublic,
    };
  }

  factory ClubModel.fromMap(Map<String, dynamic> map) {
    return ClubModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      creatorId: map['creatorId'] ?? '',
      creatorName: map['creatorName'] ?? '',
      moderatorIds: map['moderatorIds'] != null
          ? List<String>.from(map['moderatorIds'])
          : [],
      capacity: map['capacity'] ?? 0,
      eligibleClassIds: map['eligibleClassIds'] != null
          ? List<String>.from(map['eligibleClassIds'])
          : [],
      imageUrls: map['imageUrls'] != null
          ? List<String>.from(map['imageUrls'])
          : [],
      status: WorkflowState.values.firstWhere(
        (s) => s.name == map['status'],
        orElse: () => WorkflowState.draft,
      ),
      rejectionReason: map['rejectionReason'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
      memberCount: map['memberCount'] ?? 0,
      isPublic: map['isPublic'] ?? true,
    );
  }

  ClubModel copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    String? creatorId,
    String? creatorName,
    List<String>? moderatorIds,
    int? capacity,
    List<String>? eligibleClassIds,
    List<String>? imageUrls,
    WorkflowState? status,
    String? rejectionReason,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? memberCount,
    bool? isPublic,
  }) {
    return ClubModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      creatorId: creatorId ?? this.creatorId,
      creatorName: creatorName ?? this.creatorName,
      moderatorIds: moderatorIds ?? this.moderatorIds,
      capacity: capacity ?? this.capacity,
      eligibleClassIds: eligibleClassIds ?? this.eligibleClassIds,
      imageUrls: imageUrls ?? this.imageUrls,
      status: status ?? this.status,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      memberCount: memberCount ?? this.memberCount,
      isPublic: isPublic ?? this.isPublic,
    );
  }
}

class ClubMembership {
  final String id;
  final String clubId;
  final String userId;
  final String userName;
  final MembershipStatus status;
  final DateTime joinedAt;
  final bool isModerator;
  final String? role;

  ClubMembership({
    required this.id,
    required this.clubId,
    required this.userId,
    required this.userName,
    required this.status,
    required this.joinedAt,
    this.isModerator = false,
    this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clubId': clubId,
      'userId': userId,
      'userName': userName,
      'status': status.name,
      'joinedAt': Timestamp.fromDate(joinedAt),
      'isModerator': isModerator,
      'role': role,
    };
  }

  factory ClubMembership.fromMap(Map<String, dynamic> map) {
    return ClubMembership(
      id: map['id'] ?? '',
      clubId: map['clubId'] ?? '',
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      status: MembershipStatus.values.firstWhere(
        (s) => s.name == map['status'],
        orElse: () => MembershipStatus.pending,
      ),
      joinedAt: (map['joinedAt'] as Timestamp).toDate(),
      isModerator: map['isModerator'] ?? false,
      role: map['role'],
    );
  }
}
