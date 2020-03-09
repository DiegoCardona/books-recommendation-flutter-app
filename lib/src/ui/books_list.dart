import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../blocs/books_bloc.dart';

class BookList extends StatelessWidget {
  @override

  final textController = TextEditingController();

  Widget build(BuildContext context) {
    bloc.fetchAllBooks('murakami');
    return Scaffold(
      appBar: AppBar(
      ),
      body: StreamBuilder(
        stream: bloc.allBooks,
        builder: (context, AsyncSnapshot<BooksListModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<BooksListModel> snapshot) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books Search"),
      ),
      body: Center(
        child: Column(
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  controller: textController,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: "Author's Name",
                    prefixIcon: const Icon(
                      Icons.book,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: ListView.builder(
                        itemCount: snapshot.data.books.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              contentPadding: EdgeInsets.all(5),
                              leading: Image.network(
                                  snapshot.data.books[index].smallThumbnail),
                              title: Text(snapshot.data.books[index].title)
                          );
                        },

                ),
              ),
            ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
          onPressed: () {
              bloc.fetchAllBooks(textController.text);
          },
          child: Icon(Icons.search),
          backgroundColor: Colors.blueGrey
      ),
    );
  }
}