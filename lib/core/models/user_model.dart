import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/enums.dart';

class UserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final UserRole role;
  final String? photoUrl;
  final String? phoneNumber;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? updatedAt;

  // Student-specific fields
  final String? studentId;
  final String? departmentId;
  final List<String>? enrolledClassIds;
  final String? selectedClassId;

  // Professor-specific fields
  final String? employeeId;
  final List<String>? assignedClassIds;
  final List<String>? assignedDepartmentIds;

  // Parent-specific fields
  final List<String>? childrenIds;

  // Vendor-specific fields
  final String? vendorCompanyName;
  final String? vendorBusinessId;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    this.photoUrl,
    this.phoneNumber,
    this.isActive = true,
    required this.createdAt,
    this.updatedAt,
    this.studentId,
    this.departmentId,
    this.enrolledClassIds,
    this.selectedClassId,
    this.employeeId,
    this.assignedClassIds,
    this.assignedDepartmentIds,
    this.childrenIds,
    this.vendorCompanyName,
    this.vendorBusinessId,
  });

  String get fullName => '$firstName $lastName';

  String get displayName {
    switch (role) {
      case UserRole.student:
        return studentId != null ? '$fullName ($studentId)' : fullName;
      case UserRole.professor:
        return employeeId != null ? 'Prof. $fullName' : fullName;
      case UserRole.vendor:
        return vendorCompanyName ?? fullName;
      default:
        return fullName;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'role': role.name,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'isActive': isActive,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'studentId': studentId,
      'departmentId': departmentId,
      'enrolledClassIds': enrolledClassIds,
      'selectedClassId': selectedClassId,
      'employeeId': employeeId,
      'assignedClassIds': assignedClassIds,
      'assignedDepartmentIds': assignedDepartmentIds,
      'childrenIds': childrenIds,
      'vendorCompanyName': vendorCompanyName,
      'vendorBusinessId': vendorBusinessId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      role: UserRole.values.firstWhere(
        (r) => r.name == map['role'],
        orElse: () => UserRole.student,
      ),
      photoUrl: map['photoUrl'],
      phoneNumber: map['phoneNumber'],
      isActive: map['isActive'] ?? true,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
      studentId: map['studentId'],
      departmentId: map['departmentId'],
      enrolledClassIds: map['enrolledClassIds'] != null
          ? List<String>.from(map['enrolledClassIds'])
          : null,
      selectedClassId: map['selectedClassId'],
      employeeId: map['employeeId'],
      assignedClassIds: map['assignedClassIds'] != null
          ? List<String>.from(map['assignedClassIds'])
          : null,
      assignedDepartmentIds: map['assignedDepartmentIds'] != null
          ? List<String>.from(map['assignedDepartmentIds'])
          : null,
      childrenIds: map['childrenIds'] != null
          ? List<String>.from(map['childrenIds'])
          : null,
      vendorCompanyName: map['vendorCompanyName'],
      vendorBusinessId: map['vendorBusinessId'],
    );
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    UserRole? role,
    String? photoUrl,
    String? phoneNumber,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? studentId,
    String? departmentId,
    List<String>? enrolledClassIds,
    String? selectedClassId,
    String? employeeId,
    List<String>? assignedClassIds,
    List<String>? assignedDepartmentIds,
    List<String>? childrenIds,
    String? vendorCompanyName,
    String? vendorBusinessId,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      role: role ?? this.role,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      studentId: studentId ?? this.studentId,
      departmentId: departmentId ?? this.departmentId,
      enrolledClassIds: enrolledClassIds ?? this.enrolledClassIds,
      selectedClassId: selectedClassId ?? this.selectedClassId,
      employeeId: employeeId ?? this.employeeId,
      assignedClassIds: assignedClassIds ?? this.assignedClassIds,
      assignedDepartmentIds: assignedDepartmentIds ?? this.assignedDepartmentIds,
      childrenIds: childrenIds ?? this.childrenIds,
      vendorCompanyName: vendorCompanyName ?? this.vendorCompanyName,
      vendorBusinessId: vendorBusinessId ?? this.vendorBusinessId,
    );
  }
}
