import 'package:flutter/material.dart';
import 'package:scratcher_flutter/firebaseDatabase.dart';

class LoggedWiew extends StatefulWidget {
  @override
  _LoggedWiewState createState() => _LoggedWiewState();
}

class _LoggedWiewState extends State<LoggedWiew> {
  List userProfileList = [];

  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseService().getUserList();  

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfileList = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
          itemCount: userProfileList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("Email: ${userProfileList[index]['email']}"),
                subtitle: Text("Date: ${userProfileList[index]['dateTime']}"),
                trailing: Text("Won :'${userProfileList[index]['won']}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
