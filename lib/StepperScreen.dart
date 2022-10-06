import 'package:flutter/material.dart';

enum SingingCharacter { a1, a2, a3, a4 }

class StepperScreen extends StatefulWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  SingingCharacter? _character = SingingCharacter.a1;
  int _activeCurrentStep = 0;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

  List<Step> stepList() => [
        Step(
          state:
              _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: const Text('Busqueda'),
          content: Container(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Codigo'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.a1,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Nit'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.a2,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Nombre'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.a3,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Telefono'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.a4,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Buscar',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Buscar"),
                )
              ],
            ),
          ),
        ),
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            title: const Text('Facturar'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  ListTile(
                    title: const Text('CF'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.a1,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('2389234 casita feliz'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.a2,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  TextField(
                    controller: address,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full House Address',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            )),
        Step(
            state: _activeCurrentStep <= 2
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 2,
            title: const Text('Entrega'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  ListTile(
                    title: const Text('Entrega en Farmacia'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.a1,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )),
        Step(
            state: _activeCurrentStep <= 3
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 3,
            title: const Text('Telefono'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  ListTile(
                    title: const Text('45233422453'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.a1,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )),
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 4,
            title: const Text('Confirm'),
            content: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name: ${name.text}'),
                Text('Email: ${email.text}'),
                Text('Password: ${pass.text}'),
                Text('Address : ${address.text}'),
                Text('PinCode : ${pincode.text}'),
              ],
            )))
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Stepper'),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _activeCurrentStep,
          steps: stepList(),
          onStepContinue: () {
            if (_activeCurrentStep < (stepList().length - 1)) {
              setState(() {
                _activeCurrentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (_activeCurrentStep == 0) {
              return;
            }

            setState(() {
              _activeCurrentStep -= 1;
            });
          },
          onStepTapped: (int index) {
            setState(() {
              _activeCurrentStep = index;
            });
          },
        ),
      ),
    );
  }
}
