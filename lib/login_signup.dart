import 'package:flutter/material.dart';
import 'package:training/home.dart';
import 'homemade_appbar.dart';
import 'constant.dart' as constant;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training/main.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login and Sign_up',
      home: Log_in(),
    );
  }
}

class Log_in extends StatefulWidget {
  const Log_in({super.key});

  @override
  State<Log_in> createState() => _Log_in_State();
}

class _Log_in_State extends State<Log_in> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
   String _email = '';
  String _password = '';
bool mobile = false;

 List<Widget> navItem = constant.navItem;
   bool valuefirst = false;  
  bool valuesecond = false;  
  bool value = true;
  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     mobile = MediaQuery.of(context).size.width > 700 ? false : true;
    return Scaffold(
      appBar: AppBar(
        title: Text("online Learning platform"),
        actions: mobile ? null : navItem,
        elevation: 0.0,
        backgroundColor: Colors.green,
      ),
      drawer: mobile
          ? Drawer(
              child: ListView(
              children: navItem,
            ))
          : null,
    body: SafeArea(
  child: SingleChildScrollView(
    child: Column(
     children: [
             SizedBox(
                height: screenWidth *0.0005,
              ),
              HomeMade_AppBar(screenWidth: screenWidth),

             Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                onChanged:(value) {
                  _email = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (value) {
              _password = value;
                },
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async{
                    final user =await _auth.signInWithEmailAndPassword(email: _email, password: _password);
                        if (user != null) {
                          Navigator.push(context, MaterialPageRoute(
                    builder: (constext)=>MyHomePage(),
                    ));
                        }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
     ],
    ),))
    );
  }
}


