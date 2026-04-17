import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/write_screen.dart';
import '../screens/detail_screen.dart';
import '../screens/search_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/register_screen.dart';        // ← ĐÃ THÊM
import '../models/diary_entry.dart';

class AppRoutes {
  static const String home     = '/';
  static const String write    = '/write';
  static const String detail   = '/detail';
  static const String search   = '/search';
  static const String profile  = '/profile';
  static const String register = '/register';     // ← ĐÃ THÊM

  static Map<String, WidgetBuilder> get routes => {
    home:     (_) => const HomeScreen(),
    search:   (_) => const SearchScreen(),
    profile:  (_) => const ProfileScreen(),
    register: (_) => const RegisterScreen(),   // ← ĐÃ THÊM
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case write:
        return MaterialPageRoute<DiaryEntry?>(
          builder: (_) => const WriteScreen(),
          settings: settings,
        );

      case detail:
        final entry = settings.arguments as DiaryEntry;
        return MaterialPageRoute<dynamic>(
          builder: (_) => DetailScreen(entry: entry),
          settings: settings,
        );

    // Nếu sau này muốn xử lý thêm route nào khác có tham số thì thêm vào đây

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 — Không tìm thấy trang')),
          ),
        );
    }
  }
}