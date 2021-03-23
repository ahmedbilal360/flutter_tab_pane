import 'package:flutter/material.dart';

import 'package:flutter_tab_pane/flutter_tab_pane.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<TabPaneItem> list = [];

  @override
  Widget build(BuildContext context) {
    list.add(TabPaneItem(name: "1st Tab", content: "1st Content"));
    list.add(TabPaneItem(name: "2nd Tab", content: "2nd Content"));
    list.add(TabPaneItem(name: "3rd Tab", content: "3rd Content"));
    list.add(TabPaneItem(name: "4th Tab", content: "4th Content"));
    return SingleChildScrollView(
        child: TabPane(
      items: list,
      selectedTabColor: Colors.yellow,
      unSelectedTabColor: Colors.white,
      tabRadius: 12,
      borderColor: Colors.yellow,
    ));
  }
}
