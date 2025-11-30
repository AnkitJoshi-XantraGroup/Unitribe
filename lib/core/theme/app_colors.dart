import 'package:flutter/material.dart';

/// App color palette - Professional and appealing for students
class AppColors {
  // Primary Brand Colors - Modern vibrant blue-purple gradient
  static const Color primary = Color(0xFF6366F1); // Indigo - represents trust, wisdom
  static const Color primaryDark = Color(0xFF4F46E5);
  static const Color primaryLight = Color(0xFF818CF8);

  // Secondary Colors - Complementary purple
  static const Color secondary = Color(0xFF8B5CF6); // Purple
  static const Color secondaryDark = Color(0xFF7C3AED);
  static const Color secondaryLight = Color(0xFFA78BFA);

  // Accent Colors - Vibrant and energetic
  static const Color accent = Color(0xFF10B981); // Emerald green - success, growth
  static const Color accentOrange = Color(0xFFF59E0B); // Amber - energy, warmth
  static const Color accentPink = Color(0xFFEC4899); // Pink - creativity, passion

  // Backgrounds
  static const Color background = Color(0xFFF8FAFC); // Cool light gray
  static const Color surface = Color(0xFFFFFFFF); // White
  static const Color surfaceVariant = Color(0xFFF1F5F9);

  // Dark Mode
  static const Color darkBackground = Color(0xFF0F172A); // Slate dark
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkSurfaceVariant = Color(0xFF334155);

  // Text Colors
  static const Color textPrimary = Color(0xFF1E293B); // Slate 800
  static const Color textSecondary = Color(0xFF64748B); // Slate 500
  static const Color textTertiary = Color(0xFF94A3B8); // Slate 400
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Status Colors
  static const Color success = Color(0xFF10B981); // Emerald
  static const Color warning = Color(0xFFF59E0B); // Amber
  static const Color error = Color(0xFFEF4444); // Red
  static const Color info = Color(0xFF3B82F6); // Blue

  // Role-specific Colors
  static const Color roleAdmin = Color(0xFFDC2626); // Red
  static const Color roleProfessor = Color(0xFF8B5CF6); // Purple
  static const Color roleStudent = Color(0xFF3B82F6); // Blue
  static const Color roleParent = Color(0xFF10B981); // Green
  static const Color roleVendor = Color(0xFFF59E0B); // Amber

  // Feature-specific Colors
  static const Color newsColor = Color(0xFF6366F1); // Indigo
  static const Color attendanceColor = Color(0xFF10B981); // Green
  static const Color timetableColor = Color(0xFF8B5CF6); // Purple
  static const Color clubsColor = Color(0xFFEC4899); // Pink
  static const Color eventsColor = Color(0xFFF59E0B); // Amber
  static const Color vendorColor = Color(0xFF06B6D4); // Cyan

  // Attendance Status Colors
  static const Color present = Color(0xFF10B981); // Green
  static const Color absent = Color(0xFFEF4444); // Red
  static const Color late = Color(0xFFF59E0B); // Amber
  static const Color excused = Color(0xFF3B82F6); // Blue

  // Workflow Status Colors
  static const Color draft = Color(0xFF94A3B8); // Gray
  static const Color pendingApproval = Color(0xFFF59E0B); // Amber
  static const Color approved = Color(0xFF10B981); // Green
  static const Color rejected = Color(0xFFEF4444); // Red
  static const Color archived = Color(0xFF64748B); // Gray

  // UI Elements
  static const Color border = Color(0xFFE2E8F0); // Slate 200
  static const Color divider = Color(0xFFE2E8F0);
  static const Color shadow = Color(0xFF1E293B);
  static const Color overlay = Color(0x80000000);
  static const Color shimmer = Color(0xFFE2E8F0);
  static const Color chipBackground = Color(0xFFF1F5F9);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, Color(0xFF059669)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warmGradient = LinearGradient(
    colors: [accentOrange, accentPink],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient coolGradient = LinearGradient(
    colors: [primary, info],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Opacity variations
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
}
