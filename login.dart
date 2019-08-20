import 'package:flutter/material.dart';
import 'package:login/registration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  bool _ishidden = true;
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(tag: "logo",  child: Text("App logo",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
          Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 4.0, top: 32.0),
              child: buildTextField("Email")
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 4.0),
              child: buildTextField("Password")
          ),
          Padding(
              padding: const EdgeInsets.only(top: 8.0,right: 20.0),
              child: GestureDetector(
                  onTap: (){},
                  child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("Forgot password?"),
                        ],
                      )))
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 18.0),
            child: GestureDetector(
              onTap: (){},
              child: Container(
                height: 55.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                    child: Text("Login",style: TextStyle(
                      color: Colors.white,
                    ),)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 16.0),
            child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>regUser()));

                },
                child: Text("New user registration?")),
          )
        ],
      ),
    );
  }
  Widget buildTextField(String hintText){
    return TextField(
      obscureText: hintText == "Password" ? _ishidden : false,
      autofocus: false,
      keyboardType: hintText=="Password"? null: TextInputType.number ,
      decoration: InputDecoration(
          prefixIcon: Icon(hintText == "Password" ? Icons.lock : Icons.mail),
          suffixIcon: hintText == "Password" ? IconButton(
              onPressed: _VisibilityToggle,
              icon: Icon(_ishidden == true ? Icons.visibility_off : Icons.visibility)) : null,
          labelText: hintText == "Password" ? "Password" : "Phone number",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
      ),
    );
  }
  void _VisibilityToggle(){
    setState(() {
      _ishidden = ! _ishidden;
    });
  }
}
