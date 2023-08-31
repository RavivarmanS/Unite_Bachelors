import 'package:flutter/material.dart';
class Laundry extends StatelessWidget {
  const Laundry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(200, 41, 164, 172),
            title: Text("Laundry",
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
            child: Text('Laundry',style: TextStyle(fontSize: 20.0),
            ),
          ),
          bottomNavigationBar:
          BottomNavigationBar(items: [
            BottomNavigationBarItem(
              icon:Icon(Icons.sort_outlined),
              label: 'sort',),
            BottomNavigationBarItem(
              icon:Icon(Icons.filter_alt),
              label: 'filter',
            )
          ],
            backgroundColor: Color.fromARGB(200, 41, 164, 172),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            iconSize: 30.0,
          )

      ),
    );
  }
}
