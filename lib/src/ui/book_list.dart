import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../blocs/book_bloc.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllBook();
    return Scaffold(
      appBar: AppBar(
        title: Text('Reina Valera 1960'),
      ),
      body: StreamBuilder(
        stream: bloc.allBooks,
        builder: (context, AsyncSnapshot<BookModel> snapshot) {
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

  Widget buildList(AsyncSnapshot<BookModel> snapshot) {
    return ListView.builder(
        itemCount: 65,
        //gridDelegate:
        // new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: Card(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${snapshot.data.books[index].passage}',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown),
                    ),
                  ),
                ],
              )),
              onTap: () {
                print('TAp,$index');
              });

          //         style: TextStyle(
          //             fontSize: 25.0, fontWeight: FontWeight.bold)),

          //    title: Image.network(
          //      '${snapshot.data.bibles[index].imageUrl}',
          //   //fit: BoxFit.contain,
          // ),

          //     Text('${snapshot.data.bibles[index].title}',
          //         style: TextStyle(
          //             fontSize: 25.0, fontWeight: FontWeight.bold)),
        });
  }
}
