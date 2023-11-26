import 'package:flutter/material.dart';

import 'package:wallet_monitor/components/utils/button.component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[_dateSelector()],
        ),
      ),
    );
  }

  Widget _dateSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtonComponent(
            onTap: () {},
            appendIcon: 'chevron-left',
            buttonStyle: StyleButton.text,
            radius: 100,
          ),
          ButtonComponent(
            onTap: () {},
            appendIcon: 'chevron-left',
            buttonStyle: StyleButton.text,
            radius: 100,
          ),
          ButtonComponent(
            onTap: () {},
            appendIcon: 'chevron-right',
            buttonStyle: StyleButton.text,
            radius: 100,
          ),
        ],
      ),
    );
  }
}
