import 'package:flutter/material.dart';
import '../models/bible_model.dart';
import '../blocs/bible_bloc.dart';

class BibleList extends StatefulWidget {
  @override
  _BibleListState createState() => _BibleListState();
}

class _BibleListState extends State<BibleList> {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllBible();
    return Scaffold(
      appBar: AppBar(
        title: Text('Biblias Disponibles'),
      ),
      body: StreamBuilder(
        stream: bloc.allBibles,
        builder: (context, AsyncSnapshot<BibleModel> snapshot) {
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

  Widget buildList(AsyncSnapshot<BibleModel> snapshot) {
    return ListView.builder(
        itemCount: 3,
        //gridDelegate:
        // new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('$index.${snapshot.data.bibles[15].title}'),
              ),
            ],
          ));

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
