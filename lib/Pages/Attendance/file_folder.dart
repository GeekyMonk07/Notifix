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

import 'FacultyBucket.dart';

class CreateFolder extends StatefulWidget {
  const CreateFolder({Key? key}) : super(key: key);

  @override
  _CreateFolderState createState() => _CreateFolderState();
}

class _CreateFolderState extends State<CreateFolder> {
  late drive.DriveApi driveApi;
  Future<GoogleAuthClient> getSignIn() async{
    final googleSignIn = GoogleSignIn(scopes: [drive.DriveApi.driveFileScope],);
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    final authHeaders = await account!.authHeaders;
    final authenticateClient = GoogleAuthClient(authHeaders);
    return authenticateClient;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<GoogleAuthClient>(
          future: getSignIn(),
          builder: (BuildContext context, AsyncSnapshot<GoogleAuthClient> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('ERROR'),);
            } else if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator(color: Colors.purple,),);
            } else {
              driveApi = drive.DriveApi(snapshot.data!);
              return Create(driveApi: driveApi,);

              }
            }
          ,
        )
    );

  }
}





class Create extends StatefulWidget {
  drive.DriveApi driveApi;
  Create({required this.driveApi});

  @override
  _CreateState createState() => _CreateState(driveApi: driveApi);
}

class _CreateState extends State<Create> {
  drive.DriveApi driveApi;
  _CreateState({required this.driveApi});
  late TextEditingController controller;
  late Query _ref;
  late final user;
  late DatabaseReference reference;
  bool isLoading = false;
  final _database = FirebaseDatabase.instance.reference();
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    user = FirebaseAuth.instance.currentUser;
    final FirebaseDatabase database = FirebaseDatabase.instance;
    _ref = database.reference().child('/faculty/${user.uid}/attendance/sub_folders');
    reference = FirebaseDatabase.instance
        .reference()
        .child('/faculty/${user.uid}/attendance/sub_folders');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return isLoading ?Center(child: CircularProgressIndicator(color: Colors.purple,),): Material(
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
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final folder_name = await openDialog();
                          if(folder_name!=null && !folder_name.isEmpty) {
                            DataSnapshot snapshot = await _database.child('/faculty/${user.uid}/attendance/folder_id').once();
                            String folderId;
                            if(snapshot.value==null){
                              var driveFile = new drive.File();
                              driveFile.name = 'Attendance';
                              driveFile.mimeType = "application/vnd.google-apps.folder";
                              final folder = await driveApi.files.create(driveFile);
                              folderId = folder.id!;
                              await _database.child('/faculty/${user.uid}/attendance/folder_id').set({"folderId" : folderId});
                            }else{
                              folderId = snapshot.value['folderId'];
                            }
                            await create_folder_on_drive(folderId,folder_name);
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                        icon: Icon(Icons.create_new_folder,),
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
                                        builder: (context) => AttendenceBucket(
                                            folderId: snapshot.value['folder_id'],
                                            key_id:snapshot.key.toString(),
                                            driveApi: driveApi,
                                            folder_name:snapshot.value['folder_name']
                                        )));
                              },
                              leading: Icon(Icons.folder,color: Colors.deepPurple,),
                              title: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      snapshot.value['folder_name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      try {
                                        await driveApi.files
                                            .delete(snapshot.value['folder_id']);
                                        await reference
                                            .child("${snapshot.key}")
                                            .remove();
                                        Fluttertoast.showToast(
                                            msg: "Deleted succesfully");
                                      } catch (e) {
                                        Fluttertoast.showToast(msg: e.toString());
                                      }
                                      setState(() {
                                        isLoading = false;
                                      });
                                    },
                                    child: const Text("Delete"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                    ),
                                  )
                                ],
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
    );
  }
  Future<void> create_folder_on_drive(String folderId, String folder_name) async {
    var driveFile = new drive.File();
    driveFile.name = folder_name;
    driveFile.mimeType = "application/vnd.google-apps.folder";
    driveFile.parents = [folderId];
    final folder = await driveApi.files.create(driveFile);
    if (folder.id != null) {
      await _database.child('/faculty/${user.uid}/attendance/sub_folders')
          .push()
          .set({"folder_id": folder.id,
        "folder_name": folder_name});
    }
  }

    Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("New Folder"),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: "Folder name"),
            controller: controller,
          ),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop(controller.text);
                },
                child: Text('Create'))
          ],
        )
    );
}

