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
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_page.toString(), textScaler: TextScaler.linear(10.0)),
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
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 5,
            left: 10,
            right: 10,
            child: LiquidCircleFloatingNavBar(
              key: _bottomNavigationKey,
              index: _page,
              // iconPadding: 14,
              // enableGlass: true,
              // height: 80,
              // radius: 40,
              outerPadding: 10,
              items: [
                CurvedNavigationBarItem(
                  child: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.search),
                  label: 'Search',
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.chat_bubble_outline),
                  label: 'Chat',
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.newspaper),
                  label: 'Feed',
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.perm_identity),
                  label: 'Personal',
                ),
              ],
              color: Colors.white,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 600),
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
              letIndexChange: (index) => true,
            ),
          ),
        ],
      ),
    );
  }
}
