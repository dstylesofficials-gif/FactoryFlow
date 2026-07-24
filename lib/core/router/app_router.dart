import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/inventory/presentation/screens/inventory_screen.dart';
import '../../features/organization/presentation/screens/factories_screen.dart';
import '../../features/production/presentation/screens/production_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/dashboard',
    redirect: (BuildContext context, GoRouterState state) {
      final isLoggingIn = state.matchedLocation == '/login';

      if (!authState.isAuthenticated && !isLoggingIn) {
        return '/login';
      }

      if (authState.isAuthenticated && isLoggingIn) {
        return '/dashboard';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/factories',
        builder: (context, state) => const FactoriesScreen(),
      ),
      GoRoute(
        path: '/inventory',
        builder: (context, state) => const InventoryScreen(),
      ),
      GoRoute(
        path: '/production',
        builder: (context, state) => const ProductionScreen(),
      ),
      GoRoute(
        path: '/quality',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/suppliers',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/sales',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/workforce',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/reports',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/audit',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const DashboardScreen(),
      ),
    ],
  );
});
