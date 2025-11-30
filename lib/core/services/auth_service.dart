import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';
import '../constants/enums.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authServiceProvider).authStateChanges;
});

final currentUserProvider = StreamProvider<UserModel?>((ref) {
  final authService = ref.watch(authServiceProvider);
  final authState = ref.watch(authStateProvider);

  return authState.when(
    data: (user) {
      if (user == null) return Stream.value(null);
      return authService.getUserStream(user.uid);
    },
    loading: () => Stream.value(null),
    error: (_, __) => Stream.value(null),
  );
});

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Auth state changes stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Current user
  User? get currentUser => _auth.currentUser;

  // Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Sign up with email and password
  Future<UserCredential> signUpWithEmailAndPassword(
    String email,
    String password,
    String firstName,
    String lastName,
    UserRole role,
    Map<String, dynamic>? additionalData,
  ) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create user profile
      await createUserProfile(
        uid: credential.user!.uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
        role: role,
        additionalData: additionalData,
      );

      return credential;
    } catch (e) {
      rethrow;
    }
  }

  // Create user profile
  Future<void> createUserProfile({
    required String uid,
    required String email,
    required String firstName,
    required String lastName,
    required UserRole role,
    Map<String, dynamic>? additionalData,
  }) async {
    final user = UserModel(
      id: uid,
      email: email,
      firstName: firstName,
      lastName: lastName,
      role: role,
      isActive: true,
      createdAt: DateTime.now(),
      studentId: additionalData?['studentId'],
      departmentId: additionalData?['departmentId'],
      enrolledClassIds: additionalData?['enrolledClassIds'],
      employeeId: additionalData?['employeeId'],
      assignedClassIds: additionalData?['assignedClassIds'],
      assignedDepartmentIds: additionalData?['assignedDepartmentIds'],
      childrenIds: additionalData?['childrenIds'],
      vendorCompanyName: additionalData?['vendorCompanyName'],
      vendorBusinessId: additionalData?['vendorBusinessId'],
    );

    await _firestore.collection('users').doc(uid).set(user.toMap());
  }

  // Get user data
  Future<UserModel?> getUser(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (!doc.exists) return null;
      return UserModel.fromMap(doc.data()!);
    } catch (e) {
      rethrow;
    }
  }

  // Get user stream
  Stream<UserModel?> getUserStream(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((snapshot) {
      if (!snapshot.exists) return null;
      return UserModel.fromMap(snapshot.data()!);
    });
  }

  // Update user profile
  Future<void> updateUserProfile(
    String uid,
    Map<String, dynamic> data,
  ) async {
    await _firestore.collection('users').doc(uid).update({
      ...data,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // Update selected class for student
  Future<void> updateSelectedClass(String uid, String classId) async {
    await _firestore.collection('users').doc(uid).update({
      'selectedClassId': classId,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Reset password
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // Check if user has permission
  bool hasPermission(UserModel user, String permission) {
    // Implement role-based permission checks
    switch (permission) {
      case 'approve_content':
        return user.role == UserRole.administrator;
      case 'create_news':
        return user.role == UserRole.administrator ||
            user.role == UserRole.professor;
      case 'create_event':
        return user.role == UserRole.administrator ||
            user.role == UserRole.professor;
      case 'create_club':
        return user.role == UserRole.administrator ||
            user.role == UserRole.professor;
      case 'mark_attendance':
        return user.role == UserRole.administrator ||
            user.role == UserRole.professor;
      case 'create_timetable':
        return user.role == UserRole.administrator ||
            user.role == UserRole.professor;
      case 'create_vendor_offer':
        return user.role == UserRole.vendor;
      default:
        return false;
    }
  }
}
