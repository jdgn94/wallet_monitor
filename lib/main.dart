import 'package:flutter/material.dart';
import 'package:wallet_monitor/configs/themes.configs.dart';

import 'package:wallet_monitor/routes/index.routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet Monitor',
      debugShowCheckedModeBanner: false,
      theme: themeLight(colorSelected: '0'),
      darkTheme: themeDark(colorSelected: '0'),
      themeMode: _getThemeMode('light'),
      routes: getApplicationRouters(),
      initialRoute: '/home',
    );
  }

  ThemeMode _getThemeMode(String mode) {
    if (mode == 'dark') return ThemeMode.dark;
    if (mode == 'light') return ThemeMode.light;
    return ThemeMode.system;
  }
}
