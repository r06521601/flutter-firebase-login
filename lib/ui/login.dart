import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_fire_auth/ui/signup.dart';
import 'package:flutter_fire_auth/utils/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() { 
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100.0),
              Center(child: Text("Login", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.grey
              ),),),
              const SizedBox(height: 20.0),
              
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Enter email",
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(      
                    borderSide: BorderSide(color: Colors.grey),   
                    ),  
                ),
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(      
                    borderSide: BorderSide(color: Colors.grey),   
                    ),  
                ),
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                child: Text("Login"),
                onPressed: ()async {
                  if(_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                    print("Email and password cannot be empty");
                    return;
                  }
                  bool res = await AuthProvider().signInWithEmail(_emailController.text, _passwordController.text);
                  if(!res) {
                    print("Login failed");
                  }
                },
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                child: Text("Signup"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) => SignupPage()
                  ));
                },
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                child: Text("Login with Google"),
                onPressed: () async {
                  bool res = await AuthProvider().loginWithGoogle();
                  if(!res)
                    print("error logging in with google");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}