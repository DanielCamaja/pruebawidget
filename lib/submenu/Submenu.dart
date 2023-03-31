import 'package:flutter/material.dart';

class SubmenuExample extends StatelessWidget {
  const SubmenuExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _popupMenu = GlobalKey<PopupMenuButtonState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Submenu Example'),
      ),
      body: Center(
        child: PopupMenuButton(
          key: _popupMenu, // <- Here
          itemBuilder: (context) => [
            PopupMenuItem(
                child: Column(children: const [Text('item1'), Text('item2')]))
          ],
          child: ElevatedButton(
            onPressed: () {
              _popupMenu.currentState?.showButtonMenu(); // <- Here
            },
            child: const Text('show popup menu'),
          ),
        ),
      ),
    );
  }
}
