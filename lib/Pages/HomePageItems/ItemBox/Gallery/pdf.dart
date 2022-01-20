import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class pdf_view extends StatelessWidget {
  // const pdf_view({Key? key}) : super(key: key);
  final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PDFs"),
        ),
        body: Center(
            child: Column(children: [
          Text("data"),
          SizedBox(
            height: 8,
          ),
          StreamBuilder(
              stream: database
                  .child('uploadnotes')
                  .orderByKey()
                  .limitToLast(10)
                  .onValue,
              builder: (context, snapshot) {
                final tilesList = <ListTile>[];
                if (snapshot.hasData) {
                  final abc = Map<String, dynamic>.from(
                      (snapshot.data! as Event).snapshot.value);
                  abc.forEach((key, value) {
                    final next_pdf = Map<String, dynamic>.from(value);
                    final orderTile = ListTile(
                      leading: Icon(Icons.picture_as_pdf),
                      title: Text(next_pdf['file_name']),
                      onTap: () {
                        launch(next_pdf["url"]);
                      },
                    );
                    tilesList.add(orderTile);
                  });
                }
                return Expanded(
                  child: ListView(
                    children: tilesList,
                  ),
                );
              })
        ])));
  }
}
