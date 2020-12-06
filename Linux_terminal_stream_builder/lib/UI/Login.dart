import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class MyLogin extends StatefulWidget{
@override
_MyLoginState createState()=> _MyLoginState();
}


class _MyLoginState extends State<MyLogin>{
  var authc = FirebaseAuth.instance;

  String email;
  String password;
  bool sspin = false;
  
@override
Widget build(BuildContext context){
  var Homeicon=Icon(Icons.home,color: Colors.black,);
  var HomeButton=IconButton(icon: Homeicon, onPressed: null,color: Colors.black,);
  var logo=Image.network("https://www.redhat.com/cms/managed-files/styles/wysiwyg_full_width/s3/Logo-RedHat-Hat-Color-CMYK%20%281%29.jpg?itok=Mf0Ff9jq");
var appbar=AppBar(leading: logo, title: Text("User Login"),actions: <Widget>[HomeButton],backgroundColor: Colors.amber);
var myhome=Scaffold(appBar: appbar,
                    body:ModalProgressHUD(
        inAsyncCall: sspin,
        child: Center(
          child: Container(
             decoration: BoxDecoration(color: Colors.red,borderRadius:BorderRadius.only(bottomLeft: Radius.circular(80),topRight: Radius.circular(80)) ),
            height: 320,   
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    icon: Icon(Icons.mail,color: Colors.amber,)
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    icon: Icon(Icons.lock,color: Colors.amber,)
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 10,
                  child: MaterialButton(
                    minWidth: 100,
                    height: 40,
                    child: Text('Login'),
                    onPressed: () async {
                      setState(() {
                        sspin = true;
                      });

                      try {
                        var userSignin = await authc.signInWithEmailAndPassword(
                            email: email, password: password);
                        print(userSignin);

                        if (userSignin != null) {
                          Navigator.pushNamed(context, "terminal");
                          setState(() {
                            sspin = false;
                          });
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ), 
      backgroundColor: Colors.cyan,
                    );

var design=MaterialApp(home: myhome,debugShowCheckedModeBanner: false,);

return design;
}
}