import 'package:flutter/widgets.dart';
import 'package:wallet_monitor/pages/home.pages.dart';

Map<String, WidgetBuilder> getApplicationRouters() {
  return <String, WidgetBuilder>{
    '/home': (BuildContext context) => const HomePage(),
  };
}
