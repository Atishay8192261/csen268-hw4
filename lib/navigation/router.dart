import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../blocs/authentication/authentication_bloc.dart';
import '../pages/book_detail_page.dart';
import '../pages/book_list_page.dart';
import '../pages/login_page.dart';
import '../pages/profile_page.dart';
import '../utilities/stream_to_listenable.dart';
import '../widgets/scaffold_with_nav_bar.dart';

class RouteName {
  static const home = 'home';
  static const login = 'login';
  static const byAuthor = 'byAuthor';
  static const byAuthorDetail = 'byAuthorDetail';
  static const byTitle = 'byTitle';
  static const byTitleDetail = 'byTitleDetail';
  static const profile = 'profile';
}

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter(
  AuthenticationBloc authenticationBloc,
  StreamToListenable refreshListenable,
) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/byAuthor',
    refreshListenable: refreshListenable,
    redirect: (context, state) {
      final loggedIn = authenticationBloc.state is AuthenticationLoggedIn;
      if (!loggedIn && state.uri.path != '/login') {
        return '/login';
      }
      if (loggedIn && state.uri.path == '/login') {
        return '/byAuthor';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: RouteName.login,
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: '/',
        name: RouteName.home,
        builder: (context, state) {
          return const Scaffold();
        },
        redirect: (context, state) {
          if (state.uri.path == '/') {
            return '/byAuthor';
          }
          return null;
        },
        routes: [
          ShellRoute(
            navigatorKey: shellNavigatorKey,
            builder: (context, state, child) {
              return ScaffoldWithNavBar(child: child);
            },
            routes: [
              GoRoute(
                path: 'byAuthor',
                name: RouteName.byAuthor,
                builder: (context, state) {
                  return const BookListPage(byAuthor: true);
                },
                routes: [
                  GoRoute(
                    path: 'detail',
                    name: RouteName.byAuthorDetail,
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) {
                      return const BookDetailPage();
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'byTitle',
                name: RouteName.byTitle,
                builder: (context, state) {
                  return const BookListPage(byAuthor: false);
                },
                routes: [
                  GoRoute(
                    path: 'detail',
                    name: RouteName.byTitleDetail,
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) {
                      return const BookDetailPage();
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'profile',
                name: RouteName.profile,
                builder: (context, state) {
                  return const ProfilePage();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
