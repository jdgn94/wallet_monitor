import 'package:flutter/material.dart';
import 'package:wallet_monitor/components/settings/theme_selector.widget.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/storage/index.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final pref = SettingsLocalStorage.pref;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.settings),
      ),
      body: _body(),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
        child: Column(
      children: [ThemeSelectorWidget(pref: pref)],
    ));
  }
}
