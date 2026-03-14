import 'package:liquid_circle_floating_nav_bar/liquid_circle_floating_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:liquid_circle_floating_nav_bar/curved_navigation_bar_item.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<LiquidCircleFloatingNavBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_page.toString(),
                  textScaler: TextScaler.linear(10.0)),
              ElevatedButton(
                child: Text('Go To Page of index 1'),
                onPressed: () {
                  final LiquidCircleFloatingNavBarState? navBarState =
                      _bottomNavigationKey.currentState;
                  navBarState?.setPage(1);
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: LiquidCircleFloatingNavBar(
        key: _bottomNavigationKey,
        index: 0,
        iconPadding: 15,
        height: 80,
        radius: 40,
        outerPadding: 10,
        items: [
          LiquidCurvedBarItem(
            child: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          LiquidCurvedBarItem(
            child: Icon(Icons.search),
            label: 'Search',
          ),
          LiquidCurvedBarItem(
            child: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          LiquidCurvedBarItem(
            child: Icon(Icons.newspaper),
            label: 'Feed',
          ),
          LiquidCurvedBarItem(
            child: Icon(Icons.perm_identity),
            label: 'Personal',
          ),
        ],
      ),
    );
  }
}
