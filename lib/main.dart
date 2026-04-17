import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // ← đã có
import 'package:provider/provider.dart';

import 'services/hive_service.dart';
import 'services/notification_service.dart';
import 'providers/theme_provider.dart';
import 'routes/app_routes.dart';
import 'package:hive_flutter/hive_flutter.dart';   //
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();

  // ✅ Mở box 'users' khi khởi động ứng dụng
  await Hive.openBox('users');

  // ✅ Chỉ init notification trên mobile, bỏ qua trên web
  if (!kIsWeb) {
    await NotificationService.init();
  }

  final themeProvider = ThemeProvider();
  await themeProvider.init();

  runApp(
    ChangeNotifierProvider.value(
      value: themeProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      title: 'Nhật Ký',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: themeProvider.themeMode,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}