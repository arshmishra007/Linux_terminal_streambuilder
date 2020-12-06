import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class MyReg extends StatefulWidget{
@override
_MyRegState createState()=> _MyRegState();
}


class _MyRegState extends State<MyReg>{
  var authc = FirebaseAuth.instance;

  String email;
  String password;
  
  
@override
Widget build(BuildContext context){
  var Homeicon=Icon(Icons.home,color: Colors.black,);
  var HomeButton=IconButton(icon: Homeicon, onPressed: null);
  var logo=Image.network("https://www.redhat.com/cms/managed-files/styles/wysiwyg_full_width/s3/Logo-RedHat-Hat-Color-CMYK%20%281%29.jpg?itok=Mf0Ff9jq");
var appbar=AppBar(leading: logo, title: Text("User Registration"),actions: <Widget>[HomeButton],backgroundColor: Colors.amber);
var myhome=Scaffold(appBar: appbar,
                    body:Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.red,borderRadius:BorderRadius.only(bottomLeft: Radius.circular(80),topRight: Radius.circular(80)) ),
          height: 320,
          width: 320,
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
                  icon: Icon(Icons.mail,color:Colors.amber)
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
                  icon: Icon(Icons.lock,color:Colors.amber)
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
                  child: Text('Submit'),
                  onPressed: () async {
                    try {
                      var user = await authc.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      print(email);
                      print(password);
                      print(user);

                      if (user.additionalUserInfo.isNewUser == true) {
                        Navigator.pushNamed(context, "terminal");
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
      backgroundColor: Colors.cyan,
                    );

var design=MaterialApp(home: myhome,debugShowCheckedModeBanner: false,);

return design;
}
}