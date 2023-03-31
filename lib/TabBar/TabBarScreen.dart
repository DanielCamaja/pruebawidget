import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 500,
                  width: 300,
                  color: Colors.amber,
                ),
                SizedBox(
                  height: 500,
                  width: 600,
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TabBar(
                          indicator: BoxDecoration(
                              color: Colors.green[300],
                              borderRadius: BorderRadius.circular(25.0)),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: const [
                            Tab(
                              text: 'Busqueda',
                            ),
                            Tab(
                              text: 'Historico',
                            ),
                            Tab(
                              text: 'Dashboard',
                            ),
                            Tab(
                              text: 'Programas de Salud',
                            ),
                            Tab(
                              text: 'Seguros',
                            ),
                            Tab(
                              text: 'CRM(Clientes)',
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: TabBarView(
                        children: [
                          Center(
                            child: Text("Chats Pages"),
                          ),
                          Center(
                            child: Text("Status Pages"),
                          ),
                          Center(
                            child: Text('Calls Page'),
                          ),
                          Center(
                            child: Text('Settings Page'),
                          ),
                          Center(
                            child: Text('Seguos'),
                          ),
                          Center(
                            child: Text('CRM(Clientes)'),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
