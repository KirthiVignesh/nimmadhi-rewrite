import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:get/get.dart';
import 'package:nimmadhi/firebase_options.dart';

import 'auth/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      return GetMaterialApp(
        title: 'Nimmadhi',
        theme: ThemeData(
          colorScheme: lightDynamic,
          useMaterial3: true, // HERE!
        ),
        darkTheme: ThemeData(
          colorScheme: darkDynamic,
          useMaterial3: true,
          // HERE!
        ),
        themeMode: ThemeMode.system,
        home: MainPage(),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
