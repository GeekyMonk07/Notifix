import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../../constrants.dart';

class pdf_view extends StatefulWidget {
  // const pdf_view({Key? key}) : super(key: key);
  @override
  State<pdf_view> createState() => _pdf_viewState();
}

class _pdf_viewState extends State<pdf_view> {
  //scroll animation stars
  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    if(_scrollController.hasClients)
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 2), curve: Curves.linear);
  }

  //scroll animation ends
  final database = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToBottom());
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: SafeArea(
          child: Column(
            children: [
              // <-----------------------------------------------Top Bar-------------------------------------------->
              Material(
                elevation: 5,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22)),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Notifications",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  height: size.height * .075,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: secondaryPurple,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          bottomRight: Radius.circular(22))),
                ),
              ),
              // <-----------------------------------------------Top Bar ends-------------------------------------------->
              SizedBox(
                height: size.height * .015,
              ),
              Expanded(
                child: StreamBuilder(
                    stream: database
                        .child('notices')
                        .orderByChild('timestamp')
                        .limitToLast(10)
                        .onValue,
                    builder: (context, AsyncSnapshot<Event> snapshot) {
                      final tilesList = <ListTile>[];
                      if (snapshot.hasData) {
                        final abc = Map<String, dynamic>.from(
                            (snapshot.data! as Event).snapshot.value);
                        abc.forEach((key, value) {
                          final next_pdf = Map<String, dynamic>.from(value);
                          final orderTile = ListTile(
                            leading: Image.asset(
                              "assets/images/bellicon.png",
                              height: 30,
                            ),
                            title: Text(
                              next_pdf['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            subtitle: Text(
                              next_pdf['description'] +
                                  "\n\nUpdated on " +
                                  next_pdf['time'],
                              style: TextStyle(color: primaryColor, fontSize: 20),
                            ),
                          );
                          tilesList.add(orderTile);
                        });

                        return (ListView.separated(
                          controller: _scrollController,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          reverse: true,
                          padding: const EdgeInsets.all(8),
                          itemCount: tilesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Material(
                              color: secondaryPurple,
                              elevation: 3,
                              borderRadius: BorderRadius.circular(15),
                              child: Center(child: tilesList[index]),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                        ));
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      );
                    }),
              )
            ],
          )),
    );
  }
}
