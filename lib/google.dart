import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main(){
  runApp(googleLogin());
}

class googleLogin extends StatelessWidget{
  const googleLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(

            body: LogIn(),
        ),
    );
  }
}

class LogIn extends StatelessWidget{
  LogIn({Key? key}): super(key: key);

  final GoogleSignIn _googleSignIn= GoogleSignIn();
  String userName="";
  String pofilePicture="";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Color.fromARGB(200, 41, 164, 172),
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
          body: Center(
            child: Column(
              children: [
                // Container(
                //   padding: EdgeInsets.all(20.0),
                //   child: Center(
                //     child: CircleAvatar(
                //       radius: 48, // Image radius
                //       backgroundImage: AssetImage('assets/images/unite.jpg'),
                //
                //     ),
                //   ),
                //   ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0,380,20,0),
                  child: MaterialButton(
                    onPressed:(){
                      _googleSignIn.signIn().then((value){
                        userName = value!.displayName!;
                        pofilePicture = value.photoUrl!;
                        Fluttertoast.showToast(msg: "Logged in as $userName");
                      });
                    },
                    height: 50.0,
                    color: Colors.red,
                    minWidth: 300,
                    child: const Text(
                        "SignIn with Google",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: MaterialButton(
                    onPressed: (){},
                    color: Colors.blue,
                    height: 50.0,
                    minWidth: 300,
                    child: const Text(
                      "SignIn with Facebook",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

}