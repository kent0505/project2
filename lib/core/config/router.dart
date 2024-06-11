import 'package:go_router/go_router.dart';

import '../../features/home/home_page.dart';
import '../../features/information/models/news_model.dart';
import '../../features/information/pages/news_detail_page.dart';
import '../../features/plan/models/plan_model.dart';
import '../../features/plan/pages/add/add_name_page.dart';
import '../../features/plan/pages/add/add_plan_page.dart';
import '../../features/plan/pages/add/add_time_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/news',
      builder: (context, state) => NewsDetailPage(
        newsModel: state.extra as NewsModel,
      ),
    ),
    // add
    GoRoute(
      path: '/add-name',
      builder: (context, state) => const AddNamePage(),
    ),
    GoRoute(
      path: '/add-time',
      builder: (context, state) => AddTimePage(
        name: state.extra as String,
      ),
    ),
    GoRoute(
      path: '/add-plan',
      builder: (context, state) => AddPlanPage(
        planModel: state.extra as PlanModel,
      ),
    ),
  ],
);
