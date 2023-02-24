import 'package:flutter/material.dart';
import 'package:training/login_signup.dart';
import 'package:training/sign_up.dart';
class HomeMade_AppBar extends StatelessWidget {
  final Icon? icon;
  const HomeMade_AppBar({
    super.key,
    required this.screenWidth,
    this.icon
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenWidth * 0.1,
      color: Colors.green,
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidth * 0.1,
            child: Container(),
          ),
          Container(
            width: screenWidth * 0.25,
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  filled: true,
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.menu),
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
          SizedBox(width: screenWidth * 0.05,),
          Container(
            width: screenWidth * 0.5,
            child: Row(children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (constext)=>Login(),
                    ));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    Text('Login',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                    builder: (constext)=> Sign_up(),
                    ));
                  },
                  child: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text('Sign Up',
                            style: TextStyle(color: Colors.white)),
                      ))),
              TextButton(
                onPressed: () {
                  
                },
                child: Icon(
                  Icons.monitor_heart_rounded,
                  color: Colors.white,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}