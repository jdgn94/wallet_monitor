import 'package:flutter/widgets.dart';

import 'package:wallet_monitor/pages/home.page.dart';
import 'package:wallet_monitor/pages/settings.page.dart';

Map<String, WidgetBuilder> getApplicationRouters() {
  return <String, WidgetBuilder>{
    '/home': (BuildContext context) => const HomePage(),
    '/settings': (BuildContext context) => const SettingsPage(),
  };
}
