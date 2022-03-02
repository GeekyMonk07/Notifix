import 'package:appnewui/Authentication/welcomePage/UpdatePage/update.dart';
import 'package:appnewui/indexPage.dart';
import 'package:appnewui/Authentication/welcomePage/onbording.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends StatelessWidget {
  SharedPreferences prefs;
  Controller({required this.prefs});
  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<PackageInfo>(
      future: _getPackageInfo(),
      builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
        if (snapshot.hasError) {
          return const Text('ERROR');
        } else if (!snapshot.hasData) {
          return Center(child:CircularProgressIndicator(color: Colors.purple,));
        } else {
          final data = snapshot.data!;
          if (prefs.containsKey('version') &&
              data.version != prefs.getString('version')) {
            return UpdatePage();
          } else {
            return (prefs.containsKey('verified') == false ||
                    prefs.getBool('verified') == false)
                ? Onbording()
                : IndexPage();
          }
        }
      },
    ));
  }
}
