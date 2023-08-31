import 'dart:io';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Upload());
}

class PickedImage {
  final File image;

  PickedImage({required this.image});
}

class Upload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _imagePicker = ImagePicker();
  List<PickedImage> _pickedImages = [];
  bool checkboxcar=false;
  bool checkboxbike=false;

  Future<void> _pickImages() async {
    if (_pickedImages.length >= 5) {
      print('Maximum limit of 5 images reached');
      return;
    }

    List<XFile>? pickedFiles = await _imagePicker.pickMultiImage();

    if (pickedFiles != null) {
      List<File> pickedImages = pickedFiles.map((file) {
        return File(file.path);
      }).toList();

      for (var pickedImage in pickedImages) {
        await _uploadImageToFirebase(pickedImage);
      }
    } else {
      print('No images selected');
    }
  }

  Future<void> _uploadImageToFirebase(File image) async {
    final Reference storageReference =
    FirebaseStorage.instance.ref().child('images/${DateTime.now()}.png');

    final UploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.whenComplete(() {
      print('Image uploaded to Firebase Storage');
    }).catchError((error) {
      print('Image upload failed: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
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
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AppBarApp()));
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
      ),
      body:  Center(
          child: Column(
            children: [
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
                    Text("Car Parking",
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
                    Text("Bike Parking",
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
              ElevatedButton(
                onPressed: _pickImages,
                child: Text('Pick and Upload Images'),
              ),
              SizedBox(height: 20),
              Column(
                children: _pickedImages
                    .map((pickedImage) => Image.file(pickedImage.image))
                    .toList(),
              ),
            ],
          ),
        ),

    );
  }
}

