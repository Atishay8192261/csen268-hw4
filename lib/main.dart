import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'blocs/authentication/authentication_bloc.dart';
import 'navigation/router.dart';
import 'utilities/stream_to_listenable.dart';

void main() {
  runApp(const BookClubApp());
}

class BookClubApp extends StatefulWidget {
  const BookClubApp({super.key});

  @override
  State<BookClubApp> createState() {
    return _BookClubAppState();
  }
}

class _BookClubAppState extends State<BookClubApp> {
  final authenticationBloc = AuthenticationBloc();
  late final StreamToListenable refreshListenable;
  late final GoRouter router;

  @override
  void initState() {
    super.initState();
    refreshListenable = StreamToListenable(authenticationBloc.stream);
    router = createRouter(authenticationBloc, refreshListenable);
  }

  @override
  void dispose() {
    router.dispose();
    refreshListenable.dispose();
    authenticationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authenticationBloc,
      child: MaterialApp.router(
        title: 'Book Club',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.standard,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF65558F),
            primary: const Color(0xFF65558F),
          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFEF7FF),
            foregroundColor: Color(0xFF1D1B20),
            centerTitle: true,
            toolbarHeight: 64,
            elevation: 0,
            scrolledUnderElevation: 0,
            titleTextStyle: TextStyle(
              fontSize: 22,
              height: 28 / 22,
              color: Color(0xFF1D1B20),
            ),
          ),
        ),
      ),
    );
  }
}
