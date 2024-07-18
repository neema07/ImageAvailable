import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imageviewer/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Future<void> _saveData(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }
  void _signUp() async {

    String username = _usernameController.text;
    String password = _passwordController.text;

    await _saveData(username, password);
    if (username.isNotEmpty&&password.isNotEmpty) {
       Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => login()),
    );
  }
    else {

    showDialog(context: context, builder: (context)=>AlertDialog(title: Text('Invalid Input'),content: Text('Username and Password cannot be empty'),actions: [TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("OK"))],));
      
    }
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SIGNUP"),centerTitle: true,titleTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w200),),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset('assets/images/signup.png',alignment: Alignment.topCenter,),
          SizedBox(height: 60,),
          Container(
            child: Column(
              children: [
              TextField(controller:_usernameController,decoration:InputDecoration(labelText: "USERNAME",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),),
              SizedBox(height: 15,),
              TextField(controller:_passwordController,decoration:  InputDecoration(labelText: "PASSWORD",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),),
              SizedBox(height: 45,),
              ElevatedButton(onPressed: _signUp, child: Text('SIGN UP'))
            ],),
          )
        ],),
      )
      
    );
  }
}