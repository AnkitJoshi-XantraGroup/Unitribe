import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/enums.dart';

class VendorOfferModel {
  final String id;
  final String title;
  final String description;
  final String vendorId;
  final String vendorName;
  final String vendorCompany;
  final String category;
  final String terms;
  final DateTime validFrom;
  final DateTime validUntil;
  final List<String> eligibleRoles; // student, professor, staff
  final List<String> locations;
  final List<String> imageUrls;
  final String? discountCode;
  final WorkflowState status;
  final String? rejectionReason;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int viewCount;
  final int redemptionCount;
  final int maxRedemptions;

  VendorOfferModel({
    required this.id,
    required this.title,
    required this.description,
    required this.vendorId,
    required this.vendorName,
    required this.vendorCompany,
    required this.category,
    required this.terms,
    required this.validFrom,
    required this.validUntil,
    this.eligibleRoles = const [],
    this.locations = const [],
    this.imageUrls = const [],
    this.discountCode,
    this.status = WorkflowState.draft,
    this.rejectionReason,
    required this.createdAt,
    this.updatedAt,
    this.viewCount = 0,
    this.redemptionCount = 0,
    this.maxRedemptions = 0,
  });

  bool get isActive => status == WorkflowState.published &&
      DateTime.now().isAfter(validFrom) &&
      DateTime.now().isBefore(validUntil);
  bool get isExpired => DateTime.now().isAfter(validUntil);
  bool get hasRedemptionsLeft =>
      maxRedemptions == 0 || redemptionCount < maxRedemptions;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'vendorId': vendorId,
      'vendorName': vendorName,
      'vendorCompany': vendorCompany,
      'category': category,
      'terms': terms,
      'validFrom': Timestamp.fromDate(validFrom),
      'validUntil': Timestamp.fromDate(validUntil),
      'eligibleRoles': eligibleRoles,
      'locations': locations,
      'imageUrls': imageUrls,
      'discountCode': discountCode,
      'status': status.name,
      'rejectionReason': rejectionReason,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'viewCount': viewCount,
      'redemptionCount': redemptionCount,
      'maxRedemptions': maxRedemptions,
    };
  }

  factory VendorOfferModel.fromMap(Map<String, dynamic> map) {
    return VendorOfferModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      vendorId: map['vendorId'] ?? '',
      vendorName: map['vendorName'] ?? '',
      vendorCompany: map['vendorCompany'] ?? '',
      category: map['category'] ?? '',
      terms: map['terms'] ?? '',
      validFrom: (map['validFrom'] as Timestamp).toDate(),
      validUntil: (map['validUntil'] as Timestamp).toDate(),
      eligibleRoles: map['eligibleRoles'] != null
          ? List<String>.from(map['eligibleRoles'])
          : [],
      locations: map['locations'] != null
          ? List<String>.from(map['locations'])
          : [],
      imageUrls: map['imageUrls'] != null
          ? List<String>.from(map['imageUrls'])
          : [],
      discountCode: map['discountCode'],
      status: WorkflowState.values.firstWhere(
        (s) => s.name == map['status'],
        orElse: () => WorkflowState.draft,
      ),
      rejectionReason: map['rejectionReason'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
      viewCount: map['viewCount'] ?? 0,
      redemptionCount: map['redemptionCount'] ?? 0,
      maxRedemptions: map['maxRedemptions'] ?? 0,
    );
  }

  VendorOfferModel copyWith({
    String? id,
    String? title,
    String? description,
    String? vendorId,
    String? vendorName,
    String? vendorCompany,
    String? category,
    String? terms,
    DateTime? validFrom,
    DateTime? validUntil,
    List<String>? eligibleRoles,
    List<String>? locations,
    List<String>? imageUrls,
    String? discountCode,
    WorkflowState? status,
    String? rejectionReason,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? viewCount,
    int? redemptionCount,
    int? maxRedemptions,
  }) {
    return VendorOfferModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      vendorId: vendorId ?? this.vendorId,
      vendorName: vendorName ?? this.vendorName,
      vendorCompany: vendorCompany ?? this.vendorCompany,
      category: category ?? this.category,
      terms: terms ?? this.terms,
      validFrom: validFrom ?? this.validFrom,
      validUntil: validUntil ?? this.validUntil,
      eligibleRoles: eligibleRoles ?? this.eligibleRoles,
      locations: locations ?? this.locations,
      imageUrls: imageUrls ?? this.imageUrls,
      discountCode: discountCode ?? this.discountCode,
      status: status ?? this.status,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      viewCount: viewCount ?? this.viewCount,
      redemptionCount: redemptionCount ?? this.redemptionCount,
      maxRedemptions: maxRedemptions ?? this.maxRedemptions,
    );
  }
}
