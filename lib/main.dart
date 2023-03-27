import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pruebawidget/LoginPhone/LoginPhone.dart';
import 'package:pruebawidget/maps/livemaps.dart';
import 'package:pruebawidget/maps/maps_details.dart';
import 'package:pruebawidget/maps/mspsd.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool lightTheme = true;
  Color currentColor = Colors.amber;
  List<Color> currentColors = [Colors.yellow, Colors.green];
  List<Color> colorHistory = [];

  void changeColor(Color color) => setState(() => currentColor = color);
  //void changeColors(List<Color> colors) =>setState(() => currentColors = colors);

  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        useWhiteForeground(currentColor) ? Colors.white : Colors.black;
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyPhone(),
      ),
    );
    // AnimatedTheme(
    //   data: lightTheme ? ThemeData.light() : ThemeData.dark(),
    //   child: Builder(builder: (context) {
    //     return Scaffold(
    //       //
    //       floatingActionButton: FloatingActionButton.extended(
    //         onPressed: () => setState(() => lightTheme = !lightTheme),
    //         icon: Icon(lightTheme
    //             ? Icons.dark_mode_rounded
    //             : Icons.light_mode_rounded),
    //         label: Text(lightTheme ? 'Night' : '  Day '),
    //         backgroundColor: currentColor,
    //         foregroundColor: foregroundColor,
    //         elevation: 15,
    //       ),
    //       //
    //       appBar: AppBar(
    //         title: const Text('Flutter Color Picker Example'),
    //         backgroundColor: currentColor,
    //         foregroundColor: foregroundColor,
    //       ),
    //       body: Column(
    //         children: [
    //           Container(
    //             height: 200,
    //             width: 100,
    //             color: currentColor,
    //           ),
    //           Container(
    //             height: 100,
    //             width: 200,
    //             child: HSVColorPickerExample(
    //               pickerColor: currentColor,
    //               onColorChanged: changeColor,
    //               colorHistory: colorHistory,
    //               onHistoryChanged: (List<Color> colors) =>
    //                   colorHistory = colors,
    //             ),
    //           ),
    //           Container(
    //             height: 200,
    //             width: 100,
    //             color: currentColor,
    //           )
    //         ],
    //       ),
    //     );
    //   }),
    // );
  }
}

class User {
  String name;
  int age;
  String role;

  User({required this.name, required this.age, required this.role});
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatefulWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  _MyStatelessWidgetState createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  List<User> users = [
    User(name: "Sarah", age: 19, role: "Student"),
    User(name: "Janine", age: 43, role: "Professor")
  ];
  List<User> usersFiltered = [];
  TextEditingController controller = TextEditingController();
  String _searchResult = '';

  @override
  void initState() {
    super.initState();
    usersFiltered = users;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.amber,
          child: ListTile(
            leading: Icon(Icons.search),
            title: TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: 'Search', border: InputBorder.none),
                onChanged: (value) {
                  setState(() {
                    _searchResult = value;
                    usersFiltered = users
                        .where((user) =>
                            user.name.contains(_searchResult) ||
                            user.role.contains(_searchResult))
                        .toList();
                  });
                }),
            trailing: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  controller.clear();
                  _searchResult = '';
                  usersFiltered = users;
                });
              },
            ),
          ),
        ),
        DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Role',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: List.generate(
            usersFiltered.length,
            (index) => DataRow(
              cells: <DataCell>[
                DataCell(Text(usersFiltered[index].name)),
                DataCell(Text(usersFiltered[index].age.toString())),
                DataCell(Text(usersFiltered[index].role)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
