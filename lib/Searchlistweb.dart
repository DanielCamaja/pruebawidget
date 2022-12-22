import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pruebawidget/models/user_datail.dart';
import 'package:http/http.dart' as http;

class Searchlistweb extends StatefulWidget {
  const Searchlistweb({super.key});

  @override
  State<Searchlistweb> createState() => _SearchlistwebState();
}

class _SearchlistwebState extends State<Searchlistweb> {
  TextEditingController controller = TextEditingController();
  List<UserDetails> _searchresulto = [];
  List<UserDetails> _userDetails = [];
  final String url = 'http://172.20.1.244:3000/api/users/getdispositivos';

  Future<Null> getUserDetails() async {
    final response = await http.get(Uri.parse(url));
    final responseJson = jsonDecode(response.body);

    setState(() {
      for (Map<String, dynamic> user in responseJson) {
        _userDetails.add(UserDetails.fromJson(user));
      }
    });
  }

  Future refresh() async {
    setState(() => _userDetails.clear());
    getUserDetails();
  }

  @override
  void initState() {
    super.initState();

    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: onSearchTextChange,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      controller.clear();
                      onSearchTextChange('');
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: _searchresulto.length != 0 || controller.text.isNotEmpty
                  ? _userDetails.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : RefreshIndicator(
                          onRefresh: refresh,
                          child: ListView.builder(
                            itemCount: _searchresulto.length,
                            itemBuilder: (context, i) {
                              return Card(
                                child: ListTile(
                                  title: Text(
                                    "Dispositivo: ${_userDetails[i].marca} ${_userDetails[i].modelo}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purpleAccent),
                                  ),
                                  subtitle: Text(_searchresulto[i].imei),
                                ),
                              );
                            },
                          ),
                        )
                  : RefreshIndicator(
                      onRefresh: refresh,
                      child: ListView.builder(
                        itemCount: _userDetails.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              onTap: () {},
                              title: Text(
                                "Dispositivo: ${_userDetails[index].marca} ${_userDetails[index].modelo}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purpleAccent),
                              ),
                              subtitle: Text(_userDetails[index].imei),
                            ),
                          );
                        },
                      ),
                    )),
        ],
      ),
    );
  }

  onSearchTextChange(String text) async {
    _searchresulto.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.marca.contains(text) ||
          userDetail.modelo.contains(text) ||
          userDetail.imei.contains(text)) _searchresulto.add(userDetail);
    });

    setState(() {});
  }
}
