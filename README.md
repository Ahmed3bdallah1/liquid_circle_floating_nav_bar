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

```dart
Scaffold(
  bottomNvigationBar: CurvedNavigationBar(
    backgroundColor: Colors.blueAccent,
    radius: 8,
    outerPadding: 12,
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
    onTap: (index) {
      // Handle button tap
    },
  ),
  body: Container(color: Colors.blueAccent),
)
```

### Attributes

#### CurvedNavigationBar

| Attribute               | Description                                                                                                                                                |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `items`                 | List of CurvedNavigationBarItem                                                                                                                            |
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

#### CurvedNavigationBarItem

| Attribute    | Description                     |
|--------------|---------------------------------|
| `child`      | Icon of CurvedNavigationBarItem |
| `label`      | Text of CurvedNavigationBarItem |
| `labelStyle` | TextStyle for label             |

### Change page programmatically

```dart
 // State class
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
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
                    final CurvedNavigationBarState? navBarState =
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