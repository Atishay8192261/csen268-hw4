import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../navigation/router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;
    int index = 0;
    if (path.startsWith('/byTitle')) {
      index = 1;
    } else if (path.startsWith('/profile')) {
      index = 2;
    }
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'By Author',
          ),
          NavigationDestination(
            icon: Icon(Icons.text_fields),
            label: 'By Title',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.goNamed(RouteName.byAuthor);
            case 1:
              context.goNamed(RouteName.byTitle);
            case 2:
              context.goNamed(RouteName.profile);
          }
        },
      ),
    );
  }
}
