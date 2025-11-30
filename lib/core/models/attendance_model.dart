import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/enums.dart';

class AttendanceRecord {
  final String id;
  final String studentId;
  final String studentName;
  final String classId;
  final String className;
  final String subjectId;
  final String subjectName;
  final String professorId;
  final String professorName;
  final DateTime date;
  final String sessionId; // morning, afternoon, or specific lecture time
  final AttendanceStatus status;
  final String? notes;
  final DateTime markedAt;
  final DateTime? updatedAt;
  final String? correctionRequestReason;
  final bool correctionRequested;

  AttendanceRecord({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.classId,
    required this.className,
    required this.subjectId,
    required this.subjectName,
    required this.professorId,
    required this.professorName,
    required this.date,
    required this.sessionId,
    required this.status,
    this.notes,
    required this.markedAt,
    this.updatedAt,
    this.correctionRequestReason,
    this.correctionRequested = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentId': studentId,
      'studentName': studentName,
      'classId': classId,
      'className': className,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'professorId': professorId,
      'professorName': professorName,
      'date': Timestamp.fromDate(date),
      'sessionId': sessionId,
      'status': status.name,
      'notes': notes,
      'markedAt': Timestamp.fromDate(markedAt),
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
      'correctionRequestReason': correctionRequestReason,
      'correctionRequested': correctionRequested,
    };
  }

  factory AttendanceRecord.fromMap(Map<String, dynamic> map) {
    return AttendanceRecord(
      id: map['id'] ?? '',
      studentId: map['studentId'] ?? '',
      studentName: map['studentName'] ?? '',
      classId: map['classId'] ?? '',
      className: map['className'] ?? '',
      subjectId: map['subjectId'] ?? '',
      subjectName: map['subjectName'] ?? '',
      professorId: map['professorId'] ?? '',
      professorName: map['professorName'] ?? '',
      date: (map['date'] as Timestamp).toDate(),
      sessionId: map['sessionId'] ?? '',
      status: AttendanceStatus.values.firstWhere(
        (s) => s.name == map['status'],
        orElse: () => AttendanceStatus.absent,
      ),
      notes: map['notes'],
      markedAt: (map['markedAt'] as Timestamp).toDate(),
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
      correctionRequestReason: map['correctionRequestReason'],
      correctionRequested: map['correctionRequested'] ?? false,
    );
  }

  AttendanceRecord copyWith({
    String? id,
    String? studentId,
    String? studentName,
    String? classId,
    String? className,
    String? subjectId,
    String? subjectName,
    String? professorId,
    String? professorName,
    DateTime? date,
    String? sessionId,
    AttendanceStatus? status,
    String? notes,
    DateTime? markedAt,
    DateTime? updatedAt,
    String? correctionRequestReason,
    bool? correctionRequested,
  }) {
    return AttendanceRecord(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      studentName: studentName ?? this.studentName,
      classId: classId ?? this.classId,
      className: className ?? this.className,
      subjectId: subjectId ?? this.subjectId,
      subjectName: subjectName ?? this.subjectName,
      professorId: professorId ?? this.professorId,
      professorName: professorName ?? this.professorName,
      date: date ?? this.date,
      sessionId: sessionId ?? this.sessionId,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      markedAt: markedAt ?? this.markedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      correctionRequestReason: correctionRequestReason ?? this.correctionRequestReason,
      correctionRequested: correctionRequested ?? this.correctionRequested,
    );
  }
}

class AttendanceSummary {
  final String studentId;
  final String classId;
  final int totalDays;
  final int presentDays;
  final int absentDays;
  final int lateDays;
  final int excusedDays;
  final double attendancePercentage;

  AttendanceSummary({
    required this.studentId,
    required this.classId,
    required this.totalDays,
    required this.presentDays,
    required this.absentDays,
    required this.lateDays,
    required this.excusedDays,
  }) : attendancePercentage =
            totalDays > 0 ? (presentDays / totalDays) * 100 : 0;

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'classId': classId,
      'totalDays': totalDays,
      'presentDays': presentDays,
      'absentDays': absentDays,
      'lateDays': lateDays,
      'excusedDays': excusedDays,
      'attendancePercentage': attendancePercentage,
    };
  }

  factory AttendanceSummary.fromMap(Map<String, dynamic> map) {
    return AttendanceSummary(
      studentId: map['studentId'] ?? '',
      classId: map['classId'] ?? '',
      totalDays: map['totalDays'] ?? 0,
      presentDays: map['presentDays'] ?? 0,
      absentDays: map['absentDays'] ?? 0,
      lateDays: map['lateDays'] ?? 0,
      excusedDays: map['excusedDays'] ?? 0,
    );
  }
}
