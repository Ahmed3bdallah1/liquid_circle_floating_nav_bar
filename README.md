# liquid_circle_floating_nav_bar

[//]: # ([pub package]&#40;https://pub.dartlang.org/packages/curved_labeled_navigation_bar&#41;)

[//]: # ()
[//]: # (A Flutter package for easy implementation of curved navigation bar.)

[//]: # (This package is a fork of the original curved_navigation_bar from https://github.com/rafalbednarczuk/curved_navigation_bar with label for CurvedNavigationBarItem.)

[//]: # ()
[//]: # (| Label                                                                                                                       | No Label                                                                                                                          |)

[//]: # (|-----------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|)

[//]: # (| ![Gif]&#40;https://raw.githubusercontent.com/namanh11611/curved_labeled_navigation_bar/refs/heads/master/label.gif "Label Gif"&#41; | ![Gif]&#40;https://raw.githubusercontent.com/namanh11611/curved_labeled_navigation_bar/refs/heads/master/no_label.gif "No Label Gif"&#41; |)

### Add dependency

```yaml
dependencies:
  liquid_circle_floating_nav_bar: ^1.0.1 #latest version
```

### Easy to use

Use `extendBody: true` on the `Scaffold` so the body extends behind the floating nav bar and content can scroll under it.

```dart
Scaffold(
  extendBody: true,
  bottomNavigationBar: LiquidCircleFloatingNavBar(
    backgroundColor: Colors.blueAccent,
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
    onTap: (index) {
      // Handle button tap
    },
  ),
  body: Container(color: Colors.blueAccent),
)
```

### Attributes

#### LiquidCircleFloatingNavBar

| Attribute               | Description                                                                                                                                                |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `items`                 | List of LiquidCurvedBarItem                                                                                                                                |
| `outerPadding`          | The floating space area                                                                                                                                    |
| `radius`                | The radius of the corners (if null it will be circular)                                                                                                    |
| `index`                 | Index of NavigationBar, can be used to change current index or to set initial index                                                                        |
| `color`                 | Color of NavigationBar, default Colors.white                                                                                                               |
| `buttonBackgroundColor` | Background color of floating button, default same as color attribute                                                                                       |
| `backgroundColor`       | Color of NavigationBar's background, default Colors.blueAccent                                                                                             |
| `onTap`                 | Function handling taps on items                                                                                                                            |
| `letIndexChange`        | Function which takes page index as argument and returns bool. If function returns false then page is not changed on button tap. It returns true by default |
| `animationCurve`        | Curves interpolating button change animation, default Curves.easeOut                                                                                       |
| `animationDuration`     | Duration of button change animation, default Duration(milliseconds: 600)                                                                                   |
| `height`                | Height of NavigationBar                                                                                                                                    |
| `maxWidth`              | Allows to set the width of the navigation bar lower than the entire screen width by default                                                                |
| `iconPadding`           | Padding of icon in floating button                                                                                                                         |

#### LiquidCurvedBarItem

| Attribute    | Description                      |
|--------------|----------------------------------|
| `child`      | Icon of LiquidCurvedBarItem      |
| `label`      | Text of LiquidCurvedBarItem      |
| `labelStyle` | TextStyle for label              |

### Change page programmatically

```dart
 // State class
  int _page = 0;
  GlobalKey<LiquidCircleFloatingNavBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: LiquidCircleFloatingNavBar(
          key: _bottomNavigationKey,
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
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(_page.toString(), textScaler: TextScaler.linear(10.0)),
                ElevatedButton(
                  child: Text('Go To Page of index 1'),
                  onPressed: () {
                    // Page change using state does the same as clicking index 1 navigation button
                    final LiquidCircleFloatingNavBarState? navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState?.setPage(1);
                  },
                )
              ],
            ),
          ),
        ),
    );
  }
```