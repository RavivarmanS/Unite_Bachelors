import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:file/file.dart';
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


  String imageUrl='';
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
                onPressed:uploadImage,
                child: Text(
                  'Select Image'
            )
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10,20,10,0),
            child: ElevatedButton(
                onPressed:submitImage,
                child: Text(
                    'Upload Image'
                )
            ),
          ),
        ],
      ),
    );
  }
  // PlatformFile? pickedFile;
  // UploadTask? uploadTask;
  //  Future selectFile() async{
  //   final result=await FilePicker.platform.pickFiles();
  //   if(result==null) return;
  //
  //   setState(() {
  //     pickedFile=result.files.first;
  //   });
  // }
  // Future uploadFile()async{
  //    final path ='images/${pickedFile!.name}';
  //    final file = pickedFile!.name as File;
  //
  //
  //    final ref = FirebaseStorage.instance.ref().child(path);
  //    uploadTask=ref.putFile(file);
  //    final snapshot= await uploadTask!.whenComplete(() {});
  //
  //    final urlDownload= await snapshot.ref.getDownloadURL();
  //    print('Download Link:$urlDownload');
  //
  // }


  submitImage() async{

  }


Future uploadImage() async {

  // final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  // if(image==null) return;
  ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
  print('${file?.path}');

  if (file == null) return;
  String uniqueFileName = DateTime
      .now()
      .millisecondsSinceEpoch
      .toString();

  Reference referenceRoot = FirebaseStorage.instance.ref();
  Reference referenceDirImage = referenceRoot.child('images');

  Reference referenceUploadImage = referenceDirImage.child(uniqueFileName);

  try {
    await referenceUploadImage.putFile(file!.path as File);
    imageUrl=await referenceUploadImage.getDownloadURL();
  } catch (error) {
    //some error
  }
}
}



