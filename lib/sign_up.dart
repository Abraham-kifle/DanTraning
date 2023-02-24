import 'package:flutter/material.dart';
import 'package:training/homemade_appbar.dart';
import 'constant.dart' as constant;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training/login_signup.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  bool mobile = false;
   List<Widget> navItem = constant.navItem;
String userName = '';
 late String email ;
 late String password;
String? CPassword; 

final _auth = FirebaseAuth.instance;
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
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                height: screenWidth *0.0005,
              ),
                    HomeMade_AppBar(screenWidth: screenWidth),
                    SizedBox(height: screenWidth *0.034,),
              
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sign Up', style: TextStyle(
                            fontSize: screenWidth * 0.015,
                            fontWeight: FontWeight.bold,
                          )),
                          SizedBox(height: screenWidth *0.0034,),
                      Container(
                              width: screenWidth *0.37,
                              color: Colors.green,
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.end,
                          children: [ 
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.017, vertical: screenWidth * 0.017),
                                child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                                height: screenWidth *0.0005,
                                                 ),
                                       Text(
                                       'USERNAME',
                                       style: TextStyle(
                                        fontSize: screenWidth * 0.012,
                                       )
                                       ),
                                       Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.01, vertical: screenWidth * 0.01),
                                          child: SizedBox(
                                          width: screenWidth * 0.3,
                                           child: TextField(
                                                           onChanged: (value) {
                                                             userName = value;
                                                           },
                                                           textAlign: TextAlign.center,
                                                           decoration: InputDecoration(
                                                          //  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                                                           fillColor: Colors.white,
                                                           border: InputBorder.none,
                                                           filled: true,
                                                           hintText: 'Enter username',),
                                                            style: TextStyle(
                                                            fontSize: screenWidth * 0.012,),
                                                     ),
                                                                   ),
                                        ),
                                       Text('EMAIL',
                                       style: TextStyle(
                                        fontSize: screenWidth * 0.012,
                                       )),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.01, vertical: screenWidth * 0.01),
                                          child: SizedBox(
                                          width: screenWidth * 0.3,
                                           child: TextField( 
                                            onChanged: (value) {
                                              email = value;
                                            },
                                            textAlign: TextAlign.center,
                                             keyboardType: TextInputType.emailAddress,
                                                           decoration: InputDecoration(
                                                          //  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                                                           fillColor: Colors.white,
                                                           border: InputBorder.none,
                                                           filled: true,
                                                           hintText: 'Enter EMAIL',),
                                                     ),
                                                                   ),
                                        ),
                        
                                         Text('PASSWORD'
                                         ,
                                       style: TextStyle(
                                        fontSize: screenWidth * 0.012,
                                       )
                                         ),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.01, vertical: screenWidth * 0.01),
                                          child: SizedBox(
                                          width: screenWidth * 0.3,
                                           child: TextField(
                                            onChanged: (value) {
                                              CPassword = value;
                                            },
                                            obscureText: true,
                                            textAlign: TextAlign.center,
                                                           decoration: InputDecoration(
                                                          //  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                                                           fillColor: Colors.white,
                                                           border: InputBorder.none,
                                                           filled: true,
                                                           hintText: 'Enter PASSWORD',),
                                                     ),
                                                                   ),
                                        ),
                        
                                         Text('CONFIRM PASSWORD'
                                         ,
                                       style: TextStyle(
                                        fontSize: screenWidth * 0.012,
                                       )
                                         ),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.01, vertical: screenWidth * 0.01),
                                          child: SizedBox(
                                          width: screenWidth * 0.3,
                                           child: TextField(
                                                   onChanged: (value) {
                                                     password = value;
                                                   },
                                                   obscureText: true,
                                                   textAlign: TextAlign.center,
                                                           decoration: InputDecoration(
                                                          //  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                                                           fillColor: Colors.white,
                                                           border: InputBorder.none,
                                                           filled: true,
                                                           hintText: 'CONFIRM PASSWORD',),
                                                     ),
                                                                   ),
                                        ),
                                      ],
                                    ), 
                              ),
                               Container(
                                          decoration: BoxDecoration(
                                      color: Colors.blue,
                                     borderRadius: BorderRadius.circular(screenWidth * 0.013),
                                          ),
                                          child: Padding(
                                        padding:  EdgeInsets.all(screenWidth * 0.0052),
                                       child: TextButton(
                                  onPressed: () async{
                                    try {
                                      final newUser = await _auth.createUserWithEmailAndPassword(
                                       email: email,
                                       password: password,
                                           );
                                       if(newUser!=null){
                                       Navigator.push(context, MaterialPageRoute(
                                       builder: (constext)=>Login(),
                                          ));
                                       }
                                      
                                    } catch (e) {
                                      print(e);
                                    }
                                   
                                  },
                                   child: Text("REGISTER",
                                      style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.01,
                                    fontWeight: FontWeight.bold,
                                     )
                                     ),),
                                          )
                                        )
                          ],
                        ),
                      ),
                      SizedBox(height: screenWidth *0.034,),
                    ],
                  )
                  ]),
              ),))
    );
  }
}

