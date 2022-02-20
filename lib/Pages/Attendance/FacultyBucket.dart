import 'package:appnewui/Pages/Attendance/Bucketform.dart';
import 'package:appnewui/Pages/Attendance/attendance.dart';
import 'package:appnewui/Pages/HomePageItems/GoogleAuth/googleAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../constrants.dart';
import 'package:googleapis/drive/v3.dart' as drive;

class AttendenceBucket extends StatefulWidget {
  const AttendenceBucket({Key? key}) : super(key: key);

  @override
  _AttendenceBucketState createState() => _AttendenceBucketState();
}

class _AttendenceBucketState extends State<AttendenceBucket> {
  ScrollController _scrollController = ScrollController();
  late Query _ref;
  late final user;
  late drive.DriveApi driveApi;
  late DatabaseReference reference;
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    final FirebaseDatabase database = FirebaseDatabase.instance;
    _ref = database.reference().child('/faculty/${user.uid}/attendence_bucket');
    reference = FirebaseDatabase.instance
        .reference()
        .child('/faculty/${user.uid}/attendence_bucket');
    initialize();
  }

  void initialize() async {
    try {
      // final Map<String, String> authHeaders = {};
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // authHeaders['Authorization'] = prefs.getString('Authorization')!;
      // authHeaders['X-Goog-AuthUser'] = prefs.getString('X-Goog-AuthUser')!;
      // final authenticateClient = GoogleAuthClient(authHeaders);
      final googleSignIn = GoogleSignIn(scopes: [drive.DriveApi.driveFileScope],);
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      final authHeaders = await account!.authHeaders;
      final authenticateClient = GoogleAuthClient(authHeaders);
      driveApi = drive.DriveApi(authenticateClient);
    } on drive.DetailedApiRequestError catch  (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    }
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: Icon(Icons.dashboard),
                  ),
                  Text(
                    "Buckets",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Bucketform(
                                    driveApi: driveApi,
                                  )));
                    },
                    icon: Icon(Icons.add_box),
                  ),
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
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: FirebaseAnimatedList(
                defaultChild: Center(
                    child: CircularProgressIndicator(
                  color: primaryColor,
                )),
                query: _ref,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  if (snapshot.value != null)
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(25, 7, 25, 7),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Attendance(
                                          fileId: snapshot.value['Sheet_uid'],
                                          fileName: snapshot.value['fileName'],
                                          driveApi: driveApi,
                                        )));
                          },
                          leading: Icon(Icons.backup_rounded),
                          title: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  snapshot.value['subject'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  try {
                                    await driveApi.files
                                        .delete(snapshot.value['Sheet_uid']);
                                    await reference
                                        .child("${snapshot.key}")
                                        .remove();
                                    Fluttertoast.showToast(
                                        msg: "Deleted succesfully");
                                  } catch (e) {
                                    Fluttertoast.showToast(msg: e.toString());
                                  }
                                },
                                child: const Text("Delete"),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                ),
                              )
                            ],
                          ),
                          subtitle: Text(
                            snapshot.value['branch'] +
                                "  " +
                                snapshot.value['year'] +
                                " Year Section " +
                                snapshot.value['section'],
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ));
                  else {
                    return Center(
                      child: Text("Tap the add button to make sheets"),
                    );
                  }
                }),
            //
          ),
        ],
        // <-----------------------------------------------Top Bar ends-------------------------------------------->
      )),
    ));
    ;
  }
}
