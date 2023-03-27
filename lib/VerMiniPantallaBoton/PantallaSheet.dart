import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PantallaSheet extends StatefulWidget {
  const PantallaSheet({super.key});

  @override
  State<PantallaSheet> createState() => _PantallaSheetState();
}

class _PantallaSheetState extends State<PantallaSheet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isDismissible: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                builder: ((context) {
                  return Container(
                    height: 300,
                  );
                }));
          },
          child: Text("Pantalla de abajo arriba")),
    );
  }
}
