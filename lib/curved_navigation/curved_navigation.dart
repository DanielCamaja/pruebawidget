import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Column(
              children: <Widget>[Icon(Icons.home, size: 20), Text('Home')],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.local_florist, size: 20),
                Text('florist')
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.settings, size: 20),
                Text('settings')
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.settings, size: 20),
                Text('settings')
              ],
            ),
            Column(
              children: <Widget>[Icon(Icons.share, size: 20), Text('share')],
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.green,
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
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_page.toString(), textScaleFactor: 10.0),
                ElevatedButton(
                  child: Text('Go To Page of index 1'),
                  onPressed: () {
                    final CurvedNavigationBarState? navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState?.setPage(1);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
