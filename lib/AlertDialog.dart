import 'dart:convert' as convert;
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:pruebawidget/models/album.dart';
import 'package:pruebawidget/models/user_model.dart';
import 'package:searchfield/searchfield.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List countriess = [
    {
      'id': '1',
      'name': 'Brazil',
    },
    {
      'id': '2',
      'name': 'India',
    },
    {
      'id': '3',
      'name': 'Japan',
    },
    {
      'id': '4',
      'name': 'Tokyo',
    },
    {
      'id': '5',
      'name': 'Australia',
    },
    {
      'id': '6',
      'name': 'Srilanka',
    },
    {
      'id': '7',
      'name': 'Canada',
    },
  ];
  String url = "http://172.20.1.244:3000/";
//String url = Environment.API_URL + 'api/api/users/findDeliveryMen';
  var _datos = [];
  var _state = [];
  var _cities = [];

  String? country;
  String? city;
  String? state;

  bool isCountry = false;
  //
  final _searchController = TextEditingController();
  final focus = FocusNode();
  List countries = [];
  //
  //

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

//
//
//
  String? bals;
  List lisitem = ['Item1', 'Item2', 'Item3'];

  @override
  void initState() {
    //getdatos();
    fetchAlbum();
    super.initState();
  }

  int curreentste = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter AlertDialog - googleflutter.com'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownSearch<int>(
                    items: List.generate(50, (i) => i),
                    popupProps: PopupProps.menu(
                      showSearchBox: true,
                      title: Text('default fit'),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(4)),
                Expanded(
                  child: DropdownSearch<String>(
                    //mode: Mode.DIALOG,
                    items: ["Brazil", "France", "Tunisia", "Canada"],
                    //dropdownSearchDecoration: InputDecoration(labelText: "Name"),
                    onChanged: print,
                    selectedItem: "Tunisia",
                    validator: (String? item) {
                      if (item == null)
                        return "Required field";
                      else if (item == "Brazil")
                        return "Invalid item";
                      else
                        return null;
                    },
                  ),
                ),
              ],
            ),
            DropdownButtonFormField(
              //showSearchBox:true,
              hint: Text("datos"),

              icon: const Icon(Icons.keyboard_arrow_down),
              isDense: true,
              items: _datos.map((ctry) {
                return DropdownMenuItem<String>(
                    value: ctry["name"], child: Text(ctry["name"]));
              }).toList(),
              value: country,
              onChanged: (value) {
                setState(
                  () {
                    _state = [];
                    country = value!;
                  },
                );
              },
            ),
            SearchField(
              //controller: con.etiqueta,
              suggestionState: Suggestion.expand,
              suggestionAction: SuggestionAction.next,
              suggestions: _datos.map((e) => SearchFieldListItem(e)).toList(),
              textInputAction: TextInputAction.next,
              //controller: _searchController,
              hint: 'Etiqueta',
              // initialValue: SearchFieldListItem(_suggestions[2], SizedBox()),
              maxSuggestionsInViewPort: 3,
              itemHeight: 45,
              onSuggestionTap: (x) {},
            ),
            SearchField(
              focusNode: focus,
              suggestions: countries
                  .map((country) =>
                      SearchFieldListItem(country.name, item: country))
                  .toList(),
              suggestionState: Suggestion.hidden,
              hasOverlay: true,
              controller: _searchController,
              hint: 'Search by country name',
              maxSuggestionsInViewPort: 4,
              itemHeight: 45,
              // validator: (x) {
              //   if (x!.isEmpty || !containsCountry(x)) {
              //     return 'Please Enter a valid Country';
              //   }
              //   return null;
              // },
              inputType: TextInputType.text,
            ),
            DropdownButtonFormField(
              hint: Text("sda"),
              isExpanded: true,
              value: bals,
              onChanged: (newValues) {
                setState(() {
                  bals = newValues as String?;
                });
              },
              items: lisitem.map((valuesitem) {
                return DropdownMenuItem(
                  value: valuesitem,
                  child: Text(valuesitem),
                );
              }).toList(),
            )
          ],
        ),
        // child: ElevatedButton(
        //   child: Text('Alert Dialog'),
        //   onPressed: () {
        //     _preLocation();
        //   },
        // ),
      ),
    );
  }
}
