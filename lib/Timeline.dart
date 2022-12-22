import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Timeline Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Timeline(
          children: <TimelineModel>[
            TimelineModel(
              Container(
                height: 100,
                child: Center(
                  child: Text("data"),
                ),
              ),
              icon: Icon(Icons.receipt, color: Colors.white),
              iconBackground: Colors.blue,
            ),
            TimelineModel(
              Container(
                height: 100,
                child: Center(
                  child: Text("data"),
                ),
              ),
              icon: Icon(Icons.android),
              iconBackground: Colors.cyan,
            ),
          ],
          position: TimelinePosition.Center,
          iconSize: 40,
          lineColor: Colors.blue,
        ) //TimelinePage(title: 'Muslim Civilisation Doodles'),
        );
  }
}
