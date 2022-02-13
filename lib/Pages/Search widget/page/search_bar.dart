import 'package:appnewui/Pages/Search%20widget/model/notice.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchController = TextEditingController();
 late bool loading;
  late Future resultsLoaded;
  List<Notice> _allResults = [];
  List<Notice> _resultsList = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
    });
    _searchController.addListener(_onSearchChanged);
    getUsersPastTripsStreamSnapshots();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersPastTripsStreamSnapshots();
  }

  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    List<Notice> showResults = [];

    if (_searchController.text != "") {
      for (var notice in _allResults) {
        // var title = Trip.fromSnapshot(tripSnapshot).title.toLowerCase();
        var title = notice.title.toLowerCase();
        var description = notice.description.toLowerCase();
        var query = _searchController.text.toLowerCase();
        if (title.contains(query) || description.contains(query)) {
          showResults.add(notice);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getUsersPastTripsStreamSnapshots() async {
    List<Notice> list = [];
    final database = FirebaseDatabase.instance.reference();
    var snap = await database.child('notices').once();
    Map<dynamic,dynamic> result = snap.value;
    // print(result.length);
    result.forEach((key, value) {
      Map<dynamic,dynamic> map = value;
      list.add(Notice(
          time: map['time'],
          description: map['description'],
          timestamp: map['timestamp'],
          title: map['title']));
    });

    setState(() {
      _allResults = list;
      loading = false;
    });
    searchResultsList();
    return "complete";
  }

  Widget buildNotice(Notice book) => ListTile(
        title: Text(book.title),
        subtitle: Text(book.description),
      );
  @override
  Widget build(BuildContext context) {
    return loading ? Center(child: CircularProgressIndicator(color: Colors.purple,),):Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _resultsList.length,
            itemBuilder: (BuildContext context, int index) =>
                buildNotice(_resultsList[index]),
          )),
        ],
      ),
    );
  }
}
