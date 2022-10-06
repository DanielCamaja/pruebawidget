import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MostrarWidget extends StatefulWidget {
  const MostrarWidget({super.key});

  @override
  State<MostrarWidget> createState() => _MostrarWidgetState();
}

class _MostrarWidgetState extends State<MostrarWidget> {
  bool isVisible = true;
  late AnimationController _animacionboton;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("datois"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            AnimatedIconButton(
              size: 40,
              onPressed: () => setState(() => isVisible = !isVisible),
              duration: const Duration(milliseconds: 500),
              splashColor: Colors.transparent,
              icons: const <AnimatedIconItem>[
                AnimatedIconItem(
                  icon: Icon(Icons.keyboard_arrow_down_rounded,
                      color: Colors.purple),
                ),
                AnimatedIconItem(
                  icon: Icon(Icons.keyboard_arrow_up_rounded,
                      color: Colors.purple),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            if (isVisible)
              Image.asset(
                "assets/images/img_1.png",
                height: 400,
                fit: BoxFit.cover,
              ),
            const Text(
              "lsdajkhasdlkj asdkljh asdkjol asdlkj asdlkj asdkjl asdjknl asd",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      );
}
