import 'package:appnewui/Pages/Attendance/attendance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../constrants.dart';
class AttendenceBucket extends StatefulWidget {
  const AttendenceBucket({Key? key}) : super(key: key);

  @override
  _AttendenceBucketState createState() => _AttendenceBucketState();
}

class _AttendenceBucketState extends State<AttendenceBucket> {

  ScrollController _scrollController = ScrollController();
  late Query _ref;
  late final user;
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    _ref = FirebaseDatabase.instance
        .reference()
        .child('/faculty/${user.uid}/attendence_bucket');

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Material(
          child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // <-----------------------------------------------Top Bar-------------------------------------------->
                  Material(
                    elevation: 6,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        bottomRight: Radius.circular(22)),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                            child: Icon(Icons.dashboard),
                          ),

                          Text(
                            "Buckets",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          IconButton(onPressed: (){
                            // setState(() {
                            //
                            // });//y
                            Navigator.pushNamed(context,
                                "/bucketform");
                          }, icon: Icon(Icons.add_box),),

                        ],
                      ),
                      height: MediaQuery.of(context).size.height * .075,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: secondaryPurple,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                              bottomRight: Radius.circular(22))),
                    ),
                  ),
                 SizedBox(height: 25,),
                  SingleChildScrollView(
                    child: StreamBuilder(
                        stream:
                        FirebaseDatabase.instance
                            .reference().child('/faculty/${user.uid}/attendence_bucket').onValue,
                        // .limitToLast(20)

                        builder: (context, AsyncSnapshot<Event> snapshot) {
                          final tilesList = <ListTile>[];
                          if (snapshot.hasData) {
                            final abc = Map<String, dynamic>.from(
                                (snapshot.data! as Event).snapshot.value);
                            abc.forEach((key, value) {
                              final next_pdf = Map<String, dynamic>.from(value);
                              final orderTile = ListTile(
                                onTap: (){ Navigator.push(context,MaterialPageRoute(builder: (context)=>Attendance(fileId: next_pdf['Sheet_uid'],fileName:next_pdf['fileName'])));},
                                leading: Icon(Icons.backup_rounded),
                                title: Text(
                                  next_pdf['subject'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: Text(
                                  next_pdf['branch'] +
                                      "  " +
                                      next_pdf['year'] + " Year Section "+ next_pdf['section'],
                                  style: TextStyle(color: Colors.black, fontSize: 14),
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
                                return GestureDetector(
                                  onTap: (){

                                  },
                                  child: Material(
                                    color: Colors.white,
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(5),
                                    child: Center(child: tilesList[index]),
                                  ),
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
                  ),




                  ],
                  // <-----------------------------------------------Top Bar ends-------------------------------------------->


              )),
        ));;
  }
}
