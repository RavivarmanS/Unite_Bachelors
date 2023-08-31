import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:unitebachelors/upload.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Main_drawer.dart';
import 'package:geolocator/geolocator.dart';

import 'google.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AppBarApp());
}

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
debugShowCheckedModeBanner: false,

      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  String currentAddress="";
  late Position currentPosition;

  Future<Position?> _determinePosition() async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled)
      {
        Fluttertoast.showToast(msg: "Turn on your Location");
      }
    permission = await Geolocator.checkPermission();
    if(permission==LocationPermission.denied)
      {
        permission= await Geolocator.requestPermission();

        if(permission==LocationPermission.denied)
        {
          Fluttertoast.showToast(msg: "Location permission denied");
        }
      }
    if(permission==LocationPermission.deniedForever)
      {
        Fluttertoast.showToast(msg: "Location permission denied forever");
      }
    Position position= await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low
    );
    try{
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        currentPosition=position;
        currentAddress= "${place.locality},${place.administrativeArea},${place.country},${place.postalCode}";
      });
    }catch(e){
      currentAddress="Location not found";
    }
    return null;

  }

  Future<void> _showSearch() async {
    await showSearch(
      context: context,
      delegate: TheSearch(contextPage: context, controller: WebViewController()),
      query: "",
    );
  }
  int _currentindex=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(200, 41, 164, 172),
          toolbarHeight: 100,
          title: const Text('Unite Bachelors'),
          actions: <Widget>[
            IconButton(onPressed:  _showSearch
            , icon: const Icon(Icons.search)),
            IconButton(onPressed: () {
            _determinePosition();
            }, icon: const Icon(Icons.location_on_outlined)),
            IconButton(onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const googleLogin()));
            }, icon: const Icon(Icons.location_history)),

          ],
        ),
        drawer: const MainDrawer(),
        body:Center(
          child: Column(
            children: [
              Text(currentAddress,style: const TextStyle(fontSize: 20),textAlign: TextAlign.center,),
            ],
          ),

        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Upload()));
            },
            backgroundColor:  const Color.fromARGB(200, 41, 164, 172),
          child: const Icon(Icons.add),

        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(200, 41, 164, 172),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          iconSize: 30.0,
          currentIndex:_currentindex,
            items: const [
          BottomNavigationBarItem(
              icon:Icon(Icons.sort_outlined),
              label: 'sort',


          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.filter_alt),
            label: 'filter',

          )
        ],
          onTap: (index){
            setState(() {
              _currentindex=index;
            });
          },
        ),


      ),
    );
  }
}
class TheSearch extends SearchDelegate<String> {
  TheSearch({required this.contextPage, required this.controller});

  BuildContext contextPage;
  WebViewController controller;
  final suggestions1 = [
    "Tambaram",
    "Perungalathur",
    "Chengalprt",
    "Mudichur",
  ];

  @override
  String get searchFieldLabel => "Search Locations";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }



  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty ? suggestions1 : [];
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (content, index) => ListTile(
          leading: const Icon(Icons.search_outlined), title: Text(suggestions[index])),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,borderRadius: BorderRadius.circular(5)
          ),
          child:Center(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(onPressed: () {

                }, icon: const Icon(Icons.search)),
                hintText: 'search...',
                border: InputBorder.none
              ),
            ),
          ) ,
        ),
      ),
    );
  }

}


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign up/Login'),
      toolbarHeight: 120,
        backgroundColor: const Color.fromARGB(200, 41, 164, 172),
      ),
      body: const Center(
        child: Text(
          'This is a new screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}