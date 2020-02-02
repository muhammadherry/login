import 'package:flutter/material.dart';
void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xfffb4158),

      ),
      home: LoginPage(),

    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage>{
@override
Widget build(BuildContext context){
  return Scaffold(
    body: Container(
      padding: EdgeInsets.only(top:100.0,right: 20.0,bottom:20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Logo',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40.0,),
          Text(
            "LOGIn",
            style: TextStyle(
              fontSize:32.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor
            ),
          ),
          SizedBox(height: 40.0,),
          buildTextField("Email"),
          SizedBox(height: 20.0,),
          buildTextField("Password"),
          SizedBox(height: 20.0,),
          Container(
            child: Row(
              mainAxisAlignment:MainAxisAlignment.end,
              children:<Widget>[
                Text(
                  "Forgotten Password?",
                  style: TextStyle(
                    color:Theme.of(context).primaryColor,
                  ),

                ),
              ],
            ),
          ),
          SizedBox(height:50.0),
          buildButtonContainer(),
          SizedBox(height: 10.0,),
          Container(
            child:Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text("Dont have an account?"),
                    SizedBox(width: 10.0,),
                    Text("Sign Up", style: TextStyle(color: Theme.of(context).primaryColor,))
                    
                  ],
              ),
            ),
            
          ),
        ],
      ),
    ),
  );
}

Widget buildTextField(String hintText){
  return TextField(
    decoration: InputDecoration(
      hintText:hintText,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 16.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      prefixIcon: hintText == "Email"? Icon(Icons.email): Icon(Icons.lock),
      suffixIcon: hintText == "Password"? IconButton(
        onPressed:(){},
        icon: Icon(Icons.visibility_off),
      ): Container()
    ),
  );
}

Widget buildButtonContainer(){
  return Container(
    height: 56.0,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius:BorderRadius.circular(23.0),
      gradient: LinearGradient(colors: [
        Color(0xFFFB4158),
        Color(0xFFEE5623)
      ],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft
      ),
    ),
    child: Center(
      child: Text(
        "LOGIN",
        style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        ),
      ),
    ),
  );
}
}