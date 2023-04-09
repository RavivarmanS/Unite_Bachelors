import 'package:flutter/material.dart';
void main() => runApp(const SignIn());

class SignIn extends StatelessWidget{
  const SignIn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(200, 41, 164, 172),
            title: const Text("Sign In"),
          ),
          body: Center(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(0, 30, 0,20),
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Aadhar No.',
                    ),
                    maxLength: 12,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(

                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mobile No.',
                    ),
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Create Password',
                    ),
                    validator: (text) {
                      if ( text!.isNotEmpty) {
                        return "Enter a password";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Re-Enter Password',

                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(100,30,100,30),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: const Text('Submit'),
                  )
                ),
              ],
            ),
          ),
        )
    );
  }

}