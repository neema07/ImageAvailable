import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imageviewer/image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<Map<String, String>> _retrieveData() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? '';
    final password = prefs.getString('password') ?? '';
    return {'username': username, 'password': password};
  }

  void _login() async {
    String enteredUsername = _usernameController.text;
    String enteredPassword = _passwordController.text;

    Map<String, String> savedData = await _retrieveData();
    String savedUsername = savedData['username']!;
    String savedPassword = savedData['password']!;
    if (enteredUsername == savedUsername && enteredPassword == savedPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ImageListScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid username or password'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: AppBar(title: Text("LOGIN"),centerTitle: true,titleTextStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w200),),
      body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70),
              TextField(controller:  _usernameController,decoration: InputDecoration(labelText: "USERNAME",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),),
              SizedBox(height: 15,),
              TextField(controller:  _passwordController,decoration: InputDecoration(labelText: "PASSWORD",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),),
              SizedBox(height: 45,),
              ElevatedButton(onPressed: _login, child: Text("LOGIN")),
              Container(child: Image.asset('assets/images/login.png',alignment: Alignment.bottomCenter,)),
            ],)
      )
      
      
    
    );
 
  }
}