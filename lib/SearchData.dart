import 'package:flutter/material.dart';
import 'package:pruebawidget/components/BookPagew.dart';
import 'package:pruebawidget/models/book.dart';

class SearchDataScreen extends StatefulWidget {
  const SearchDataScreen({super.key});

  @override
  State<SearchDataScreen> createState() => _SearchDataScreenState();
}

class _SearchDataScreenState extends State<SearchDataScreen> {
  var txt = TextEditingController();
  String? asd;

  List<Book> books = allBooks;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "titulo",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              onChanged: searchbook,
            ),
          ),
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];

                return ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(book.urlImage),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(book.title),
                  onTap: () {
                    asd = book.title;
                    cambio();
                  },
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => BookPage(book: book),
                  //   ),
                  // ),
                );
              },
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("data")),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.green, spreadRadius: 3),
              ],
            ),
            child: TextFormField(
              enabled: false,
              controller: txt,
            ),
          )
        ],
      ),
    );
  }

  void cambio() {
    txt.text = "${asd}";
  }

  void searchbook(String query) {
    final suggestions = allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();

      return bookTitle.contains(input);
    }).toList();

    setState(() => books = suggestions);
  }
}
