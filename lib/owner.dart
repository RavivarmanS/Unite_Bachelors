import 'dart:io';
import 'package:file/file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() => runApp(owner());

class owner extends StatelessWidget{

  const owner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("House Details",
              textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            ),
            backgroundColor: Color.fromARGB(200, 41, 164, 172),
          ),
          body: HouseDetails(),

    )
    );
  }

}

class HouseDetails extends StatefulWidget {

  HouseDetails({Key? key}) : super(key: key);

  @override
  State<HouseDetails> createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  bool checkboxcar=false;
  bool checkboxbike=false;
  late Future <File> imageFile;

  pickImage(ImageSource source){
    imageFile=ImagePicker().pickImage(source: source) as Future<File>;
  }

  Widget? showImage(){
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10,10,10,0),
            child: TextField(
              obscureText: true,
              controller: null,
              decoration: InputDecoration(
                labelText: 'House Name',
                border: OutlineInputBorder()
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10,10,10,0),
            child: TextField(
              obscureText: true,
              controller: null,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder()
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10,10,10,0),
            child: TextField(
              obscureText: true,
              controller: null,
              decoration: InputDecoration(
                labelText: 'Rent',
                border: OutlineInputBorder()
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10,10,10,0),
            child: TextField(
              obscureText: true,
              controller: null,
              decoration: InputDecoration(
                  labelText: 'sq.ft',
                  border: OutlineInputBorder()
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10,10,10,0),
            child: TextField(
              obscureText: true,
              controller: null,
              decoration: InputDecoration(
                  labelText: 'BHK',
                  border: OutlineInputBorder()
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10,10,10,0),
            child: TextField(
              obscureText: true,
              controller: null,
              decoration: InputDecoration(
                  labelText: 'Mobile No.',
                  border: OutlineInputBorder()
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10,10,10,0),
            child: TextField(
              obscureText: true,
              controller: null,
              decoration: InputDecoration(
                  labelText: 'Landmarks',
                  border: OutlineInputBorder()
              ),
            ),
          ),
          Container(

            padding: EdgeInsets.fromLTRB(10,10,10,0),
            child: Text("Parking",style: TextStyle(fontSize: 15),)
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10,5,10,0),

            child: Row(
              children: [
                Checkbox(
                  value: checkboxcar,
                  onChanged: (bool? value) {
                    setState((){
                      checkboxcar=value!;
                    });
                  },
                ),
                Text("Car",
                  style: TextStyle(
                      fontSize: 20.0,
                  ),
                ),
                Checkbox(
                  value: checkboxbike,
                  onChanged: (bool? value) {
                    setState((){
                      checkboxbike=value!;
                    });
                  },
                ),
                Text("Bike",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10,10,10,0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 5,//Normal textInputField will be displayed
              maxLines: 10,
              decoration: InputDecoration(
                labelText: 'Description',
                  border: OutlineInputBorder(),

              ),
            ),
          ),
          // Container(
          //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          //   child: Text('Selected'),
          // ),
          Container(
            padding: EdgeInsets.fromLTRB(10,10,10,0),
            child: ElevatedButton(
                onPressed: ()=>uploadImage(),
                child: Text(
                  'Upload Image'
            )
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10,20,10,0),
            child: ElevatedButton(
                onPressed: ()=>null,
                child: Text(
                    'Submit'
                )
            ),
          ),
        ],
      ),
    );
  }
}

Future uploadImage() async{


  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(image==null) return;

}


