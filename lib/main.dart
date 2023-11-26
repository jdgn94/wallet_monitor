import 'package:flutter/material.dart';

import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:wallet_monitor/bloc/global_settings/global_settings_bloc.dart';

import 'package:wallet_monitor/configs/themes.configs.dart';
import 'package:wallet_monitor/db/services/database.service.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/routes/index.routes.dart';
import 'package:wallet_monitor/storage/index.dart';
import 'package:wallet_monitor/utils/fetch_controllers.utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SettingsLocalStorage.configureSettings();
  await DatabaseService().database();
  // await FetchController.getAllCurrencies();

  final pref = SettingsLocalStorage.pref;

  runApp(AppState(pref: pref));
}

class AppState extends StatelessWidget {
  final SharedPreferences pref;

  const AppState({super.key, required this.pref});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GlobalSettingsBloc>(
            create: (_) => GlobalSettingsBloc(pref: pref)),
      ],
      child: MyApp(pref: pref),
    );
  }
}

class MyApp extends StatelessWidget {
  final SharedPreferences pref;

  const MyApp({super.key, required this.pref});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalSettingsBloc, GlobalSettingsState>(
        builder: (context, state) {
      print("Nombre del idioma ${state.lang}");
      return MaterialApp(
        title: 'Wallet Monitor',
        debugShowCheckedModeBanner: false,
        theme: themeLight(colorSelected: '0'),
        darkTheme: themeDark(colorSelected: '0'),
        themeMode: _getThemeMode(state.globalMode),
        routes: getApplicationRouters(),
        initialRoute: '/home',
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          LocaleNamesLocalizationsDelegate(),
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale.fromSubtags(
          languageCode: state.lang,
        ),
      );
    });
  }

  ThemeMode _getThemeMode(String mode) {
    if (mode == 'dark') return ThemeMode.dark;
    if (mode == 'light') return ThemeMode.light;
    return ThemeMode.system;
  }
}
