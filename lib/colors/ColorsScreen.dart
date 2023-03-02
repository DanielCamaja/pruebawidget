import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ColorsSCreen extends StatefulWidget {
  const ColorsSCreen({super.key});

  @override
  State<ColorsSCreen> createState() => _ColorsSCreenState();
}

class _ColorsSCreenState extends State<ColorsSCreen> {
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}
