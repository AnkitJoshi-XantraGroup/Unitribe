import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/enums.dart';

class TimetableEntry {
  final String id;
  final String classId;
  final String className;
  final String subjectId;
  final String subjectName;
  final String professorId;
  final String professorName;
  final String dayOfWeek; // Monday, Tuesday, etc.
  final String startTime; // HH:mm format
  final String endTime;
  final String room;
  final String? notes;
  final DateTime effectiveFrom;
  final DateTime? effectiveTo;
  final int version;
  final WorkflowState status;
  final String? rejectionReason;
  final DateTime createdAt;
  final DateTime? updatedAt;

  TimetableEntry({
    required this.id,
    required this.classId,
    required this.className,
    required this.subjectId,
    required this.subjectName,
    required this.professorId,
    required this.professorName,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    required this.room,
    this.notes,
    required this.effectiveFrom,
    this.effectiveTo,
    this.version = 1,
    this.status = WorkflowState.draft,
    this.rejectionReason,
    required this.createdAt,
    this.updatedAt,
  });

  bool get isActive {
    final now = DateTime.now();
    return status == WorkflowState.published &&
        now.isAfter(effectiveFrom) &&
        (effectiveTo == null || now.isBefore(effectiveTo!));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'classId': classId,
      'className': className,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'professorId': professorId,
      'professorName': professorName,
      'dayOfWeek': dayOfWeek,
      'startTime': startTime,
      'endTime': endTime,
      'room': room,
      'notes': notes,
      'effectiveFrom': Timestamp.fromDate(effectiveFrom),
      'effectiveTo': effectiveTo != null ? Timestamp.fromDate(effectiveTo!) : null,
      'version': version,
      'status': status.name,
      'rejectionReason': rejectionReason,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    };
  }

  factory TimetableEntry.fromMap(Map<String, dynamic> map) {
    return TimetableEntry(
      id: map['id'] ?? '',
      classId: map['classId'] ?? '',
      className: map['className'] ?? '',
      subjectId: map['subjectId'] ?? '',
      subjectName: map['subjectName'] ?? '',
      professorId: map['professorId'] ?? '',
      professorName: map['professorName'] ?? '',
      dayOfWeek: map['dayOfWeek'] ?? '',
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
      room: map['room'] ?? '',
      notes: map['notes'],
      effectiveFrom: (map['effectiveFrom'] as Timestamp).toDate(),
      effectiveTo: map['effectiveTo'] != null
          ? (map['effectiveTo'] as Timestamp).toDate()
          : null,
      version: map['version'] ?? 1,
      status: WorkflowState.values.firstWhere(
        (s) => s.name == map['status'],
        orElse: () => WorkflowState.draft,
      ),
      rejectionReason: map['rejectionReason'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
    );
  }

  TimetableEntry copyWith({
    String? id,
    String? classId,
    String? className,
    String? subjectId,
    String? subjectName,
    String? professorId,
    String? professorName,
    String? dayOfWeek,
    String? startTime,
    String? endTime,
    String? room,
    String? notes,
    DateTime? effectiveFrom,
    DateTime? effectiveTo,
    int? version,
    WorkflowState? status,
    String? rejectionReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TimetableEntry(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      className: className ?? this.className,
      subjectId: subjectId ?? this.subjectId,
      subjectName: subjectName ?? this.subjectName,
      professorId: professorId ?? this.professorId,
      professorName: professorName ?? this.professorName,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      room: room ?? this.room,
      notes: notes ?? this.notes,
      effectiveFrom: effectiveFrom ?? this.effectiveFrom,
      effectiveTo: effectiveTo ?? this.effectiveTo,
      version: version ?? this.version,
      status: status ?? this.status,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ClassInfo {
  final String id;
  final String name;
  final String departmentId;
  final String departmentName;
  final String semester;
  final String academicYear;
  final int studentCount;
  final DateTime createdAt;

  ClassInfo({
    required this.id,
    required this.name,
    required this.departmentId,
    required this.departmentName,
    required this.semester,
    required this.academicYear,
    this.studentCount = 0,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'departmentId': departmentId,
      'departmentName': departmentName,
      'semester': semester,
      'academicYear': academicYear,
      'studentCount': studentCount,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory ClassInfo.fromMap(Map<String, dynamic> map) {
    return ClassInfo(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      departmentId: map['departmentId'] ?? '',
      departmentName: map['departmentName'] ?? '',
      semester: map['semester'] ?? '',
      academicYear: map['academicYear'] ?? '',
      studentCount: map['studentCount'] ?? 0,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}
