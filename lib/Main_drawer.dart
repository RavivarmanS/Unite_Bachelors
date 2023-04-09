import 'package:flutter/material.dart';
import 'package:unitebachelors/Bike_Rental.dart';
import 'package:unitebachelors/Electrician.dart';
import 'package:unitebachelors/Help.dart';
import 'package:unitebachelors/Home_Food.dart';
import 'package:unitebachelors/Laundry.dart';
import 'package:unitebachelors/Plumber.dart';
import 'package:unitebachelors/Wishlist.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15.0),
              color: Colors.cyan,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 90.0),
                      child: Text('Services',style: TextStyle(fontSize: 30.0)),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.fastfood_outlined),
              title: Text('Home Food',style: TextStyle(fontSize: 18.0),),
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeFood()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.motorcycle_outlined),
              title: Text('Bike Rental',style: TextStyle(fontSize: 18.0),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BikeRental()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.electric_bolt_outlined),
              title: Text('Electrician',style: TextStyle(fontSize: 18.0),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Electrician()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.water_drop_outlined),
              title: Text('Plumber',style: TextStyle(fontSize: 18.0),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Plumber()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.local_laundry_service_outlined),
              title: Text('Laundry',style: TextStyle(fontSize: 18.0),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Laundry()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.favorite_border_outlined),
              title: Text('Wishlist',style: TextStyle(fontSize: 18.0),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Wishlist()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help_outline_outlined),
              title: Text('Help',style: TextStyle(fontSize: 18.0),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()));
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}