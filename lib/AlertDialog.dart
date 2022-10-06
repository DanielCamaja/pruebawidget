import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int curreentste = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter AlertDialog - googleflutter.com'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Alert Dialog'),
          onPressed: () {
            _preLocation();
          },
        ),
      ),
    );
  }

  Map<String, bool> cityList = {
    'Balagam': false,
    'Bangalore': false,
    'Hyderabad': false,
    'Chennai': false,
    'Delhi': false,
    'Surat': false,
    'Junagadh': false,
    'Porbander': false,
    'Rajkot': false,
    'Pune': false,
  };

  Future<Future> _preLocation() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: Text('Preferred Location'),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, null);
                    },
                    child: Text('Cancle'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, cityList);
                    },
                    child: Text('Done'),
                  ),
                ],
                content: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Stepper(
                    currentStep: curreentste,
                    onStepTapped: (index) {
                      setState(() => curreentste = index);
                    },
                    onStepContinue: () {
                      if (curreentste != 2) {
                        setState(() => curreentste++);
                      }
                    },
                    steps: [
                      Step(
                        isActive: curreentste >= 0,
                        title: Text("Step1"),
                        content: Text("as"),
                      ),
                      Step(
                        isActive: curreentste >= 1,
                        title: Text("Step2"),
                        content: Text("as"),
                      ),
                      Step(
                        isActive: curreentste >= 2,
                        title: Text("Step3"),
                        content: Text("as"),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  //
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert!!"),
          actions: <Widget>[
            ElevatedButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          content: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Stepper(
              currentStep: curreentste,
              onStepTapped: (index) {
                setState(() => curreentste = index);
              },
              onStepContinue: () {
                if (curreentste != 2) {
                  setState(() => curreentste++);
                }
              },
              steps: [
                Step(
                  isActive: curreentste >= 0,
                  title: Text("Step1"),
                  content: Text("as"),
                ),
                Step(
                  isActive: curreentste >= 1,
                  title: Text("Step2"),
                  content: Text("as"),
                ),
                Step(
                  isActive: curreentste >= 2,
                  title: Text("Step3"),
                  content: Text("as"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
