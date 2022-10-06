import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sa"),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildCard(),
          SizedBox(
            width: 10,
          ),
          buildCard(),
          SizedBox(
            width: 10,
          ),
          buildCard(),
          SizedBox(
            width: 10,
          ),
          buildCard(),
          SizedBox(
            width: 10,
          ),
          buildCard(),
          SizedBox(
            width: 10,
          ),
          buildCard(),
          SizedBox(
            width: 10,
          ),
          buildCard(),
          SizedBox(
            width: 10,
          ),
          buildCard(),
          SizedBox(
            width: 10,
          ),
          buildCard(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget buildCard() => Container(
        width: 200,
        height: 200,
        color: Colors.amber,
      );
}
