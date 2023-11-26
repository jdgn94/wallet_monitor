import 'package:flutter/material.dart';

import 'package:wallet_monitor/components/utils/button.component.dart';
import 'package:wallet_monitor/utils/icons.utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet Monitor'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/settings'),
            icon: Icon(
              getIcon('settings'),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _dateSelector(),
        ],
      ),
    );
  }

  Widget _dateSelector() {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtonComponent(
            onTap: () {},
            appendIcon: 'chevron-left',
            buttonStyle: StyleButton.plain,
            radius: 100,
          ),
          ButtonComponent(
            onTap: () {},
            text: '${currentDate.month} ${currentDate.year}',
            prependIcon: 'menu-down',
            buttonStyle: StyleButton.plain,
            radius: 100,
            width: MediaQuery.of(context).size.width * .7,
            align: MainAxisAlignment.center,
          ),
          ButtonComponent(
            onTap: () {},
            appendIcon: 'chevron-right',
            buttonStyle: StyleButton.plain,
            radius: 100,
          ),
        ],
      ),
    );
  }
}
