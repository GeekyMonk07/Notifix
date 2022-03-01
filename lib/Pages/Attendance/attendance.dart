import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constrants.dart';

class Attendance extends StatefulWidget {
  final String fileId;
  final String fileName;
  drive.DriveApi driveApi;

  Attendance(
      {required this.fileId, required this.fileName, required this.driveApi});

  @override
  _AttendanceState createState() =>
      _AttendanceState(fileId: fileId, fileName: fileName, driveApi: driveApi);
}

class _AttendanceState extends State<Attendance> {
  final String fileId;
  final String fileName;
  drive.DriveApi driveApi;

  _AttendanceState(
      {required this.fileId, required this.fileName, required this.driveApi});
  bool check = false;
  String appBarTitle = "Attendance";
  late var excel, excelTemp;
  late Sheet sheet;
  bool loading = true;

  // late Style present,absent;
  // String fileId = "1dAX-6eXw65CjQPq9f8neHUJVanOD_BJW";

  //specify you drive files id here
  // String fileId = "19jF3lOVW563LU6mEjqAjXVLNQ7poXY1Z"; //xlsx file quiz madhav

  @override
  void initState() {
    super.initState();
    initialize(); //authentication drive apis
  }

  void initialize() async {
    await downloadFile();
  }

  Future<void> downloadFile() async {
    try {
      drive.Media? response = (await driveApi.files.get(fileId,
          downloadOptions: drive.DownloadOptions.fullMedia)) as drive.Media?;

      List<int> dataStore = [];
      response!.stream.listen((data) {
        dataStore.insertAll(dataStore.length, data);
      }, onDone: () {
        excel = Excel.decodeBytes(dataStore);
        sheet = excel['Sheet1'];
        for (int i = 2; i < sheet.maxCols; ++i) {
          var cell = sheet.rows[0][i]!.value;
          String val = cell.toString().toLowerCase();
          if (val == "null") {
            break;
          } else {
            var newItem = DateSelector(
              selectedIndex: 1,
              date: val,
              month: val,
              index: i,
            );
            dateValues.add(newItem);
          }
        }
        setState(() {
          loading = false;
        });

        Fluttertoast.showToast(msg: "File fetching complete");
      }, onError: (error) {
        Fluttertoast.showToast(msg: error.toString());
      });
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> fileUpdate() async {
    setState(() {
      loading = true;
    });
    try {
      var driveFile = new drive.File();
      driveFile.name = fileName + '.xlsx';

      final List<int> bytes = (excel.encode()) as List<int>;
      final Stream<List<int>> mediaStream =
          Future.value(bytes).asStream().asBroadcastStream();
      var media = new drive.Media(mediaStream, bytes.length);
      await driveApi.files.update(driveFile, fileId, uploadMedia: media);

      Fluttertoast.showToast(msg: "Sucesfully updated");
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    setState(() {
      loading = false;
    });
  }

  int itr = 1;
  List<DateSelector> dateValues = [];
  int selectedIndex = 1;

  CellStyle present = CellStyle(
    fontColorHex: "#Ffffff",
    backgroundColorHex: "#80ff00",
    fontFamily: getFontFamily(FontFamily.Calibri),
  );
  CellStyle absent = CellStyle(
    fontColorHex: "#Ffffff",
    backgroundColorHex: "#Ea4a73",
    fontFamily: getFontFamily(FontFamily.Calibri),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
      ),
      body: loading == true
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurpleAccent,
              ),
            )
          : Column(children: [
              Container(
                height: 100,
                child: ListView.separated(
                    padding: EdgeInsets.all(16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => DateSelector(
                          selectedIndex: selectedIndex,
                          index: index + 1,
                          date: dateValues[index].date,
                          month: dateValues[index].month,
                          ontap: () {
                            setState(() {
                              selectedIndex = index + 1;
                              itr = index + 1;
                            });
                          },
                        ),
                    separatorBuilder: (context, _) => SizedBox(
                          width: 12,
                        ),
                    itemCount: dateValues.length),
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                      itemCount: sheet.maxRows - 1,
                      itemBuilder: (context, index) {
                        var cell = sheet.cell(CellIndex.indexByColumnRow(
                            rowIndex: index + 1, columnIndex: itr + 1));
                        String val = cell.value.toString().toLowerCase();
                        // if (cell.value == null ||
                        //     (val != 'present' && val != 'absent')) {
                        //   cell.value = 'absent';
                        //   cell.cellStyle = absent;
                        // }

                        return ListTile(
                          subtitle:
                              Text(sheet.rows[index + 1][0]!.value.toString()),
                          title: Row(
                            children: <Widget>[
                              const Icon(Icons.person),
                              Expanded(
                                child: Text(
                                    sheet.rows[index + 1][1]!.value.toString()),
                              ),
                              SizedBox(
                                width: 40, // <-- Your width
                                height: 40, // <-- Your height
                                child: Center(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        onPrimary: cell.value=='present' ? Colors.white : Colors.black,
                                          primary: cell.value == 'present'
                                              ? Colors.green
                                              : Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          cell.value = "present";
                                          cell.cellStyle = present;
                                        });
                                      },
                                      child: const Text('P')),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              SizedBox(
                                width: 40, // <-- Your width
                                height: 40, // <-- Your height
                                child: Center(
                                  child: ElevatedButton(

                                      style: ElevatedButton.styleFrom(
                                        onPrimary: cell.value=='absent'?Colors.white:Colors.black,
                                          primary: cell.value == 'absent'
                                              ? Colors.red
                                              : Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          cell.value = "absent";
                                          cell.cellStyle = absent;
                                        });
                                      },
                                      child: const Text('A'
                                      )),
                                ),
                              ),

                              // (cell.value.toString().toLowerCase().trim() ==
                              //         'absent')
                              //     ? ElevatedButton(
                              //         onPressed: () {
                              //           setState(() {
                              //             cell.value = "present";
                              //             cell.cellStyle = present;
                              //           });
                              //         },
                              //         child: const Text("Mark Present"),
                              //         style: ButtonStyle(
                              //           backgroundColor:
                              //               MaterialStateProperty.all(
                              //                   Colors.green),
                              //         ),
                              //       )
                              //     : ElevatedButton(
                              //         onPressed: () {
                              //           setState(() {
                              //             cell.value = "absent";
                              //             cell.cellStyle = absent;
                              //           });
                              //         },
                              //         child: const Text("Mark Absent"),
                              //         style: ButtonStyle(
                              //           backgroundColor:
                              //               MaterialStateProperty.all(
                              //                   Colors.red),
                              //         ),
                              //       ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        ),
                        onPressed: () {
                          try {
                            markAll(1);
                          } catch (e) {
                            Fluttertoast.showToast(msg: "Error");
                          }
                        },
                        child: const Text("Mark all P"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        ),
                        onPressed: () {
                          try {
                            markAll(0);
                          } catch (e) {
                            Fluttertoast.showToast(msg: "Error");
                          }
                        },
                        child: const Text("Mark all A"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          fileUpdate();
                        },
                        child: const Text("Update"),
                      ),
                    ],
                  )
                ],
              )
            ]),
    ));
  }

  void markAll(int id) {
    for (int i = 1; i < sheet.maxRows; ++i) {
      var cell = sheet
          .cell(CellIndex.indexByColumnRow(rowIndex: i, columnIndex: itr + 1));
      if (id == 1) {
        setState(() {
          cell.cellStyle = present;
          cell.value = 'present';
        });
      } else {
        setState(() {
          cell.cellStyle = absent;
          cell.value = 'absent';
        });
      }
    }
  }
}

class DateSelector extends StatelessWidget {
  final String date;
  final String month;
  int index;
  int selectedIndex;
  final VoidCallback? ontap;

  DateSelector(
      {Key? key,
      required this.index,
      required this.selectedIndex,
      this.ontap,
      required this.date,
      required this.month})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    List month = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JLY',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC'
    ];
    return Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: ontap,
          child: Container(
            height: 30,
            width: 70,
            decoration: BoxDecoration(
              color: selectedIndex == index ? primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  month[monthNum(date, 1) - 1],
                  style: TextStyle(
                      fontSize: 10,
                      color:
                          selectedIndex == index ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  monthNum(date, 2).toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color:
                          selectedIndex == index ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  monthDay(date),
                  style: TextStyle(
                      fontSize: 16,
                      color:
                          selectedIndex == index ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ));
  }

  String monthDay(String date) {
    // print(date);
    final DateTime day = DateFormat('d/M/yyyy').parse(date);
    final DateFormat formatter = DateFormat('E');
    return formatter.format(day);
  }

  int monthNum(String date, int id) {
    // print(date);
    final DateTime day = DateFormat('d/M/yyyy').parse(date);
    // print(day);

    if (id == 1) {
      // print(day.month);
      return day.month;
    } else if (id == 2) {
      return day.day;
    } else {
      return day.weekday;
    }
  }
}
