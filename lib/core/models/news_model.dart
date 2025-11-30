import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/enums.dart';

class NewsModel {
  final String id;
  final String title;
  final String body;
  final String authorId;
  final String authorName;
  final AudienceType audienceType;
  final List<String> targetAudience; // class IDs, department IDs, or user IDs
  final List<String> attachmentUrls;
  final List<String> tags;
  final WorkflowState status;
  final String? rejectionReason;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final DateTime? expiresAt;
  final bool commentsEnabled;
  final int viewCount;
  final int likeCount;
  final int commentCount;

  NewsModel({
    required this.id,
    required this.title,
    required this.body,
    required this.authorId,
    required this.authorName,
    required this.audienceType,
    this.targetAudience = const [],
    this.attachmentUrls = const [],
    this.tags = const [],
    this.status = WorkflowState.draft,
    this.rejectionReason,
    required this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.expiresAt,
    this.commentsEnabled = false,
    this.viewCount = 0,
    this.likeCount = 0,
    this.commentCount = 0,
  });

  bool get isPublished => status == WorkflowState.published;
  bool get isPendingApproval => status == WorkflowState.pendingApproval;
  bool get isExpired => expiresAt != null && expiresAt!.isBefore(DateTime.now());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'authorId': authorId,
      'authorName': authorName,
      'audienceType': audienceType.name,
      'targetAudience': targetAudience,
      'attachmentUrls': attachmentUrls,
      'tags': tags,
      'status': status.name,
      'rejectionReason': rejectionReason,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'publishedAt': publishedAt != null ? Timestamp.fromDate(publishedAt!) : null,
      'expiresAt': expiresAt != null ? Timestamp.fromDate(expiresAt!) : null,
      'commentsEnabled': commentsEnabled,
      'viewCount': viewCount,
      'likeCount': likeCount,
      'commentCount': commentCount,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      authorId: map['authorId'] ?? '',
      authorName: map['authorName'] ?? '',
      audienceType: AudienceType.values.firstWhere(
        (a) => a.name == map['audienceType'],
        orElse: () => AudienceType.global,
      ),
      targetAudience: map['targetAudience'] != null
          ? List<String>.from(map['targetAudience'])
          : [],
      attachmentUrls: map['attachmentUrls'] != null
          ? List<String>.from(map['attachmentUrls'])
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
      publishedAt: map['publishedAt'] != null
          ? (map['publishedAt'] as Timestamp).toDate()
          : null,
      expiresAt: map['expiresAt'] != null
          ? (map['expiresAt'] as Timestamp).toDate()
          : null,
      commentsEnabled: map['commentsEnabled'] ?? false,
      viewCount: map['viewCount'] ?? 0,
      likeCount: map['likeCount'] ?? 0,
      commentCount: map['commentCount'] ?? 0,
    );
  }

  NewsModel copyWith({
    String? id,
    String? title,
    String? body,
    String? authorId,
    String? authorName,
    AudienceType? audienceType,
    List<String>? targetAudience,
    List<String>? attachmentUrls,
    List<String>? tags,
    WorkflowState? status,
    String? rejectionReason,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    DateTime? expiresAt,
    bool? commentsEnabled,
    int? viewCount,
    int? likeCount,
    int? commentCount,
  }) {
    return NewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      audienceType: audienceType ?? this.audienceType,
      targetAudience: targetAudience ?? this.targetAudience,
      attachmentUrls: attachmentUrls ?? this.attachmentUrls,
      tags: tags ?? this.tags,
      status: status ?? this.status,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt ?? this.publishedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      commentsEnabled: commentsEnabled ?? this.commentsEnabled,
      viewCount: viewCount ?? this.viewCount,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
    );
  }
}
