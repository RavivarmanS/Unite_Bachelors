import 'package:flutter/material.dart';
class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(200, 41, 164, 172),
            title: Text("Help",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black54,
              ),
            ),
          ),
          body:Center(
            child: Text('Help',style: TextStyle(fontSize: 20.0),
            ),
          )

      ),
    );
  }
}
