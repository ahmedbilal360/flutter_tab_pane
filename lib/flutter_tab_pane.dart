library flutter_tab_pane;

import 'package:flutter/material.dart';

/// A Calculator.
class TabPane extends StatefulWidget {
  List<TabPaneItem> items;

  TabPane({@required this.items});

  @override
  _TabPaneState createState() => _TabPaneState();
}

class _TabPaneState extends State<TabPane> {
  int _current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 32,
            width: double.maxFinite,
            child: ListView.builder(
                itemCount: widget.items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _current_index = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 2),
                      width: (widget.items[index].name.length * 10).toDouble(),
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.orange),
                          color: _current_index == index
                              ? Colors.orange
                              : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                          child: Text(
                        widget.items[index].name,
                        style: TextStyle(
                          color: _current_index != index
                              ? Colors.orange
                              : Colors.white,
                        ),
                      )),
                    ),
                  );
                }),
          ),
          IndexedStack(
            index: _current_index,
            children: [
              for (final tabItem in widget.items) Text(tabItem.content),
            ],
          )
        ],
      ),
    );
  }
}

class TabPaneItem {
  String name;
  String content;

  TabPaneItem({this.name, this.content});
}
