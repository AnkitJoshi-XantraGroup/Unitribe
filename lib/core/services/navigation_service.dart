import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../models/user_model.dart';
import 'auth_service.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final isAuthenticated = authState.value != null;
      final isSplash = state.matchedLocation == '/splash';
      final isAuth = state.matchedLocation.startsWith('/auth');

      if (isSplash) {
        return null; // Let splash page handle the redirect
      }

      if (!isAuthenticated && !isAuth) {
        return '/auth/login';
      }

      if (isAuthenticated && isAuth) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/auth/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/auth/signup',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'news',
            builder: (context, state) => const NewsListPage(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return NewsDetailPage(newsId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: 'attendance',
            builder: (context, state) => const AttendancePage(),
          ),
          GoRoute(
            path: 'timetable',
            builder: (context, state) => const TimetablePage(),
          ),
          GoRoute(
            path: 'clubs',
            builder: (context, state) => const ClubsListPage(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return ClubDetailPage(clubId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: 'events',
            builder: (context, state) => const EventsListPage(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return EventDetailPage(eventId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: 'vendor-offers',
            builder: (context, state) => const VendorOffersListPage(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return VendorOfferDetailPage(offerId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
          GoRoute(
            path: 'approvals',
            builder: (context, state) => const ApprovalsPage(),
          ),
        ],
      ),
    ],
  );
});

// Placeholder pages - will be implemented in features
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Home Page')));
  }
}

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('News List')));
  }
}

class NewsDetailPage extends StatelessWidget {
  final String newsId;
  const NewsDetailPage({super.key, required this.newsId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('News Detail: $newsId')));
  }
}

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Attendance')));
  }
}

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Timetable')));
  }
}

class ClubsListPage extends StatelessWidget {
  const ClubsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Clubs List')));
  }
}

class ClubDetailPage extends StatelessWidget {
  final String clubId;
  const ClubDetailPage({super.key, required this.clubId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Club Detail: $clubId')));
  }
}

class EventsListPage extends StatelessWidget {
  const EventsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Events List')));
  }
}

class EventDetailPage extends StatelessWidget {
  final String eventId;
  const EventDetailPage({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Event Detail: $eventId')));
  }
}

class VendorOffersListPage extends StatelessWidget {
  const VendorOffersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Vendor Offers')));
  }
}

class VendorOfferDetailPage extends StatelessWidget {
  final String offerId;
  const VendorOfferDetailPage({super.key, required this.offerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Offer Detail: $offerId')));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Profile')));
  }
}

class ApprovalsPage extends StatelessWidget {
  const ApprovalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Approvals Dashboard')));
  }
}
