import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'shared/providers/global_provider.dart';
import 'shared/theme/app_theme.dart';
import 'shared/widgets/bottom_nav_bar.dart';
import 'features/bbs/widgets/bbs_page.dart';
import 'features/mine/widgets/mine_page.dart';
import 'features/favorite/widgets/favorite_page.dart';
import 'features/reader/widgets/reader_web_page.dart';
import 'features/manga/widgets/manga_web_page.dart';
import 'features/history/widgets/history_page.dart';
import 'features/settings/widgets/settings_page.dart';

Page<T> _slideTransition<T>(Widget child) => CustomTransitionPage<T>(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.fastOutSlowIn;
        final tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/favorite',
    routes: [
      ShellRoute(
        builder: (context, state, child) => _AppShellWrapper(child: child),
        routes: [
          GoRoute(
            path: '/favorite',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const FavoritePage(),
              transitionsBuilder: (_, animation, _, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: '/bbs',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const BBSPage(),
              transitionsBuilder: (_, animation, _, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: '/mine',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const MinePage(),
              transitionsBuilder: (_, animation, _, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/reader',
        pageBuilder: (context, state) {
          final url = state.uri.queryParameters['url'] ?? '';
          return _slideTransition(ReaderWebPage(url: url));
        },
      ),
      GoRoute(
        path: '/manga',
        pageBuilder: (context, state) {
          final url = state.uri.queryParameters['url'] ?? '';
          return _slideTransition(MangaWebPage(url: url));
        },
      ),
      GoRoute(
        path: '/history',
        pageBuilder: (context, state) =>
            _slideTransition(const HistoryPage()),
      ),
      GoRoute(
        path: '/settings',
        pageBuilder: (context, state) =>
            _slideTransition(const SettingsPage()),
      ),
    ],
  );
});

class _AppShellWrapper extends ConsumerStatefulWidget {
  final Widget child;

  const _AppShellWrapper({required this.child});

  @override
  ConsumerState<_AppShellWrapper> createState() => _AppShellWrapperState();
}

class _AppShellWrapperState extends ConsumerState<_AppShellWrapper> {
  int _currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final location = GoRouterState.of(context).uri.toString();
    _updateIndex(location);
  }

  void _updateIndex(String location) {
    if (location.startsWith('/bbs')) {
      _currentIndex = 1;
    } else if (location.startsWith('/mine')) {
      _currentIndex = 2;
    } else {
      _currentIndex = 0;
    }
  }

  void _onTabTapped(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
    switch (index) {
      case 0:
        context.go('/favorite');
      case 1:
        context.go('/bbs');
      case 2:
        context.go('/mine');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

class YamiboApp extends ConsumerWidget {
  const YamiboApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: '300文学',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(themeMode),
      routerConfig: router,
    );
  }
}
