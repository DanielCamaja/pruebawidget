import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';

class BotonAnimatee extends StatefulWidget {
  @override
  _BotonAnimateeState createState() => _BotonAnimateeState();
}

class _BotonAnimateeState extends State<BotonAnimatee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedIconButton(
          size: 100,
          onPressed: () {},
          duration: const Duration(milliseconds: 500),
          splashColor: Colors.transparent,
          icons: const <AnimatedIconItem>[
            AnimatedIconItem(
              icon:
                  Icon(Icons.keyboard_arrow_down_rounded, color: Colors.purple),
            ),
            AnimatedIconItem(
              icon: Icon(Icons.keyboard_arrow_up_rounded, color: Colors.purple),
            ),
          ],
        ),
        // AnimatedIconButton
      ),
    );
  }
}
