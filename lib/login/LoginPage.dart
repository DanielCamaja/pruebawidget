import 'package:flutter/material.dart';
import 'package:pruebawidget/login/Api.dart';
import 'package:pruebawidget/login/add_user_page.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class User {
  String id;
  String name;
  User(this.id, this.name);
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  List<User> users = [];
  Future<void> refreshUsers() async {
    var result = await http_get('users');
    if (result.ok) {
      setState(() {
        users.clear();
        var in_users = result.data as List<dynamic>;
        in_users.forEach((in_user) {
          users.add(User(in_user['id'].toString(), in_user['name']));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AddUserPage();
              }));
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshUsers,
        child: ListView.separated(
          itemCount: users.length,
          itemBuilder: (context, i) => ListTile(
            leading: Icon(Icons.person),
            title: Text(users[i].name),
          ),
          separatorBuilder: (context, i) => Divider(),
        ),
      ),
    );
  }
}
