library flutter_tab_pane;

import 'package:flutter/material.dart';

class TabPane extends StatefulWidget {
  final List<TabPaneItem> items;
  final Color selectedTabColor;
  final Color unSelectedTabColor;
  final Color borderColor;
  final double tabRadius;

  TabPane(
      {@required this.items,
      this.selectedTabColor = Colors.orange,
      this.unSelectedTabColor = Colors.white,
      this.borderColor = Colors.orange,
      this.tabRadius = 10});

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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                          border:
                              Border.all(width: 1, color: widget.borderColor),
                          color: _current_index == index
                              ? widget.selectedTabColor
                              : widget.unSelectedTabColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(widget.tabRadius))),
                      child: Center(
                          child: Text(
                        widget.items[index].name,
                        style: TextStyle(
                          color: _current_index != index
                              ? widget.selectedTabColor
                              : widget.unSelectedTabColor,
                        ),
                      )),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 5,
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

  TabPaneItem({@required this.name, @required this.content});
}
