import "package:flutter/material.dart";

class MyHome extends StatefulWidget{
@override
_MyHomeState createState()=> _MyHomeState();
}
class _MyHomeState extends State<MyHome>{
  @override
  Widget build(BuildContext context){
     var Homeicon=Icon(Icons.home,color: Colors.grey,);
  var HomeButton=IconButton(icon: Homeicon, onPressed: null,color: Colors.black,);
  
  var logo=Image.network("https://www.redhat.com/cms/managed-files/styles/wysiwyg_full_width/s3/Logo-RedHat-Hat-Color-CMYK%20%281%29.jpg?itok=Mf0Ff9jq");
  var loginButton=MaterialButton(onPressed:(){ Navigator.pushNamed(context, "login"); },minWidth: 150,color: Colors.black, textColor: Colors.white,padding: EdgeInsets.all(20),splashColor: Colors.red,child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 25),),);
  var registerButton=MaterialButton(onPressed:(){ Navigator.pushNamed(context, "reg"); },minWidth: 150,color: Colors.black, textColor: Colors.white,padding: EdgeInsets.all(20),splashColor: Colors.red,child: Text("Register",style: TextStyle(color: Colors.white,fontSize: 25),),);
  var container=Container(alignment: Alignment.bottomCenter,
                          //margin: EdgeInsets.all(10),
                          height: 320,
                          width: 320,
                          //padding: EdgeInsets.all(100),
                          decoration: BoxDecoration(color: Colors.red,borderRadius:BorderRadius.only(bottomLeft: Radius.circular(80),topRight: Radius.circular(80)) ),
                          child: Column( mainAxisAlignment: MainAxisAlignment.center,

                                         children: <Widget>[Container(margin: EdgeInsets.all(10),child: loginButton),
                                         Container(margin: EdgeInsets.all(10),child: registerButton),
                                         ],

                          ),
                          );
  var appbar=AppBar(leading: logo, title: Text("TerminalApp"),actions: <Widget>[HomeButton],backgroundColor: Colors.amber);
  var myHome=Scaffold(appBar: appbar,body: Center(child: container), backgroundColor: Colors.cyan,);
  var design=MaterialApp(home:myHome,debugShowCheckedModeBanner: false,);
  return design;
  }

}