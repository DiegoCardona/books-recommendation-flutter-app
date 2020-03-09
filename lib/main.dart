import 'package:flutter/material.dart';
import 'src/app.dart';

void main(){
  runApp(App());
}


/*import 'package:flutter/material.dart';
import 'ui/books_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  Future<BooksList> futureBooks;
  final myController = TextEditingController();

  initState() {
    super.initState();
    futureBooks = fetchBook("murakami");
  }

  dispose() {
    super.dispose();
    myController.dispose();
  }


  @override
  build(context) {
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
                  controller: myController,
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
                child:  FutureBuilder<BooksList>(
                  future: futureBooks,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.books.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              contentPadding: EdgeInsets.all(5),
                              leading: Image.network(snapshot.data.books[index].smallThumbnail),
                              title: Text(snapshot.data.books[index].title)
                          );
                        },
                      );
                    } else if (snapshot.hasError) {

                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ),
              ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          // When the user presses the button, show an alert dialog containing
          // the text that the user has entered into the text field.
          onPressed: () {
            setState(() {
              futureBooks = fetchBook(myController.text);
            });
          },
          child: Icon(Icons.search),
          backgroundColor: Colors.blueGrey
        ),
    );
  }
}*/