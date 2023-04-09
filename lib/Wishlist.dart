import 'package:flutter/material.dart';
class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(200, 41, 164, 172),
            title: Text("Wishlist",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body:Center(
            child: Text('Wishlist',style: TextStyle(fontSize: 20.0),
            ),
          )

      ),
    );
  }
}
