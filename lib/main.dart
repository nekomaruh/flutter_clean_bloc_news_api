import 'package:flutter/material.dart';
import 'package:flutter_clean_bloc_news_api/di.dart';
import 'package:flutter_clean_bloc_news_api/features/config/routes/app_routes.dart';
import 'package:flutter_clean_bloc_news_api/features/config/theme/app_theme.dart';

const String _appName = 'Flutter Demo';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.main,
      initialRoute: NavRoutes.main,
      routes: NavRoutes.all,
    );
  }
}
