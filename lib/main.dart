import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lootlo_app_admin_dash/providers/theme_provider.dart';
import 'package:lootlo_app_admin_dash/screens/login_screen.dart';
import 'package:lootlo_app_admin_dash/utils/routes.dart';
import 'package:lootlo_app_admin_dash/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';


/*
   1. TODO Add Add Product Functionality
   2. TODO Search for some graphs and pi charts and integrate them on home screen
   3. TODO Discuss about the Admin's Profile Section and Implement it
   4. TODO Make code as much refactored as possible for responsiveness
   5. TODO If some ample time is found and no solution is found, implement the mobile/tablet responsive designs
   6. TODO Implement the Search/Filter Functionalities
   7. TODO Make the Side bar more clean and nice and use some package for that
   8. TODO Do we need to store notifications into the dashboard?
 */

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
          theme: lightTheme(),
          darkTheme: darkTheme(),
          themeMode: Provider.of<ThemeProvider>(context).themeMode,
          // themeMode: ThemeMode.dark,
          initialRoute: Routes.initialRoute,
          routes: Routes.routes,
          onUnknownRoute: Routes.onUnknownRoute,
          home: LoginScreen(),
        ),
      ),
    );
  }
}
