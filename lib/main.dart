import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/providers/theme_provider.dart';
import 'package:lootlo_app_admin_dash/screens/home_screen.dart';
import 'package:lootlo_app_admin_dash/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDxm8Lnu_7VvDQRbFtSIqPIduVufukbLtI",
      appId: "1:905129192059:web:ef54cd8e0274352535d0de",
      messagingSenderId: "905129192059",
      projectId: "lootlo-admin-dashboard",
    ),
  );

  runApp(const LootLoAdminDashboard());
}

class LootLoAdminDashboard extends StatelessWidget {
  const LootLoAdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (_) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        builder: (context, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Lootlo Admin',
          // themeMode: ThemeMode.dark,
          themeMode: Provider.of<ThemeProvider>(context).themeMode,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
