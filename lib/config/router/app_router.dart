import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/permissions',
      builder: (context, state) => const PermissionScreen()),
  //! sensors
  GoRoute(
      path: '/gyroscope', builder: (context, state) => const GyroscopeScreen()),
  GoRoute(
      path: '/acelerometer',
      builder: (context, state) => const AccelerometerScreen()),
  GoRoute(
      path: '/magnetometer',
      builder: (context, state) => const MagnetometerScreen()),
  GoRoute(path: '/compass', builder: (context, state) => const CompassScreen()),
  GoRoute(
      path: '/gyroscope-ball',
      builder: (context, state) => const GyroscopeBallScreen()),
  GoRoute(
      path: '/pokemon',
      builder: (context, state) => const PokemonScreen(),
      routes: const [
        // GoRoute(path: ':id', builder: (context, state) => const PokemonInfoScreen()),
      ]),
], initialLocation: '/');
