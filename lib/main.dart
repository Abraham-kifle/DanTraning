// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'homemade_appbar.dart';
import 'constant.dart' as constant;
import 'on_hover_button.dart';
 import 'package:firebase_core/firebase_core.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Training',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool mobile = false;
  int activeIndex = 0;
  final controller = CarouselController();
  List<Widget> navItem = constant.navItem;

  final urlImages = [
    'https://images.pexels.com/photos/4144222/pexels-photo-4144222.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/4144221/pexels-photo-4144221.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/4144223/pexels-photo-4144223.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
  ];

  List<String> displayText = [
    'Data Structure and algorithm' ,
     'java programming',
     'c++ programming',
     'phyton programming'
      ];

      final List<Map<String, dynamic>> gridmap = [
      {
        "title": "Coding Interview",
        "price": "free",
        "images":  "https://images.pexels.com/photos/4144222/pexels-photo-4144222.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "titles": "Interview Question For Computer Scientists and Software Enginering"
      },
          {
        "title": "Work Readiness",
        "price": "free",
        "images":  "https://images.pexels.com/photos/4144221/pexels-photo-4144221.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "titles": "Work Readiness Training"
      },
          {
        "title": "Coding With C++",
        "price": "free",
        "images":  "https://images.pexels.com/photos/4144223/pexels-photo-4144223.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "titles": "The Essence of Computer Science - C++ for pepole in DanEnergy"
      },
      {
        "title": "WordPress Website",
        "price": "free",
        "images":  "https://images.pexels.com/photos/4144223/pexels-photo-4144223.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "titles": "Compelte E-Commerce Development Using Word Press For Absoulte begginer"
      },

       {
        "title": "Digital Marketing",
        "price": "free",
        "images":  "https://images.pexels.com/photos/4144222/pexels-photo-4144222.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "titles": "Digital Marketing For Bussiness"
      },
          {
        "title": "Video Editing",
        "price": "free",
        "images":  "https://images.pexels.com/photos/4144221/pexels-photo-4144221.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "titles": "Adobe Premeire Pro Video Editing Course Begginer"
      },
          {
        "title": "Graphics Design",
        "price": "free",
        "images":  "https://images.pexels.com/photos/4144223/pexels-photo-4144223.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "titles": "Introduction of photoshop Begginer Master"
      },
      {
        "title": "3D Animation",
        "price": "free",
        "images":  "https://images.pexels.com/photos/4144223/pexels-photo-4144223.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "titles": "Complete Blender Creator Learn 3D Modelling For Begginer"
      },

      ];

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
            backgroundColor: Colors.black,
              child: ListView(
              children: navItem,
            ))
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: screenWidth *0.0005,
              ),
              HomeMade_AppBar(screenWidth: screenWidth,),

            SizedBox(height: screenWidth * 0.07,),
                  Container(
                    height: screenWidth *0.2,
                            child: Row(
                              children: [
                              SizedBox(
                                width: screenWidth * 0.1,
                                child: IconButton(
                                  icon: Icon(Icons.arrow_back_ios),
                                                    onPressed: () => controller.previousPage()),
                              ),
                                           Expanded(
                                            flex: 4,
                                             child: CarouselSlider.builder(
                                           
                                              itemCount: urlImages.length, 
                                              itemBuilder: (context, index , realIndex){
                                               final urlImage = urlImages[index];
                                               return buildImage(urlImage, index, displayText);
                                              },
                                           
                                               options: CarouselOptions(
                                                initialPage: 0,
                                                viewportFraction: 1,
                                                height: 800,
                                                onPageChanged: (index, reason) => setState(() => activeIndex = index),
                                               )),
                                           ),
                                SizedBox(
                                  width: screenWidth * 0.1,
                                  child: IconButton(
                                                icon: Icon(Icons.arrow_forward_ios, color: Colors.red),
                                                onPressed: () => controller.nextPage()),
                                )
                              ],
                            )
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                               SizedBox(height: 32),
                               buildIndicator(),
                                ],
                              ),
                            ),
                              
                      SizedBox(height: screenWidth * 0.07),

                       Container(
                        width: screenWidth,
                         child: Column(
                           children: [
                            Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               OnHoverButton(
                                  builder: ((isHovered) {
                                    final color =isHovered ? Colors.black : Colors.black;
                                    return OutlinedButton(  
                                      style: OutlinedButton.styleFrom(
                                        side:BorderSide(color: Colors.blue,width: 1),
                                        shape: StadiumBorder(),
                                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.017, vertical: screenWidth *0.017)
                                      ),
                                      onPressed: (){
                                 
                                      }, child: Text(
                                        '3D Priniting Concept',style: TextStyle(
                                          fontSize: screenWidth * 0.015,
                                          color: color,
                                        ),
                                     ));
                                  }), 
                                 ),
                                 SizedBox(width: screenWidth * 0.02),
                                  OnHoverButton(
                                  builder: ((isHovered) {
                                    final color =isHovered ? Colors.black : Colors.black;
                                    return OutlinedButton(  
                                      style: OutlinedButton.styleFrom(
                                        side:BorderSide(color: Colors.blue,width: 1),
                                        shape: StadiumBorder(),
                                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.017, vertical: screenWidth *0.017)
                                      ),
                                      onPressed: (){
                                 
                                      }, child: Row(
                                        children: [
                                          Text(
                                            'Communication',style: TextStyle(
                                              fontSize: screenWidth * 0.015,
                                              color: color,
                                            ),
                                     ),
                                        ],
                                      ));
                                  }), 
                                 ),
                                 SizedBox(width: screenWidth * 0.02),
                                  OnHoverButton(
                                  builder: ((isHovered) {
                                    final color =isHovered ? Colors.black : Colors.black;
                                    return OutlinedButton(  
                                      style: OutlinedButton.styleFrom(
                                        side:BorderSide(color: Colors.blue,width: 1),
                                        shape: StadiumBorder(),
                                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.017, vertical: screenWidth *0.017)
                                      ),
                                      onPressed: (){
                                 
                                      }, child: Text(
                                        'Conceptual Art',style: TextStyle(
                                          fontSize: screenWidth * 0.015,
                                          color: color,
                                        ),
                                     ));
                                  }), 
                                 ),
                                 SizedBox(width: screenWidth * 0.02),
                                  OnHoverButton(
                                  builder: ((isHovered) {
                                    final color =isHovered ? Colors.black : Colors.black;
                                    return OutlinedButton(  
                                      style: OutlinedButton.styleFrom(
                                        side:BorderSide(color: Colors.blue,width: 1),
                                        shape: StadiumBorder(),
                                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.017, vertical: screenWidth *0.017)
                                      ),
                                      onPressed: (){
                                 
                                      }, child: Row(
                                        children: [
                                          Text(
                                            'Development',style: TextStyle(
                                              fontSize: screenWidth * 0.015,
                                              color: color,
                                            ),
                                     ),
                                        ],
                                      ));
                                  }), 
                                 ),
                            ],),
                                      SizedBox(height: 20,),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.green
                                  ),
                                ),
                                 OnHoverButton(
                                  builder: ((isHovered) {
                                    final color =isHovered ? Colors.black : Colors.black;
                                    return OutlinedButton(  
                                      style: OutlinedButton.styleFrom(
                                        side:BorderSide(color: Colors.blue,width: 1),
                                        shape: StadiumBorder(),
                                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.017, vertical: screenWidth *0.017)
                                      ),
                                      onPressed: (){
                                 
                                      }, child: Text(
                                        'Health & Fitness',style: TextStyle(
                                          fontSize: screenWidth * 0.015,
                                          color: color,
                                        ),
                                     ));
                                  }), 
                                 ),
                                 SizedBox(width: screenWidth * 0.02),
                                  OnHoverButton(
                                  builder: ((isHovered) {
                                    final color =isHovered ? Colors.black : Colors.black;
                                    return OutlinedButton(  
                                      style: OutlinedButton.styleFrom(
                                        side:BorderSide(color: Colors.blue,width: 1),
                                        shape: StadiumBorder(),
                                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.017, vertical: screenWidth *0.017)
                                      ),
                                      onPressed: (){
                                 
                                      }, child: Row(
                                        children: [
                                          Text(
                                            'Material Design',style: TextStyle(
                                              fontSize: screenWidth * 0.015,
                                              color: color,
                                            ),
                                     ),
                                        ],
                                      ));
                                  }), 
                                 ),
                                 SizedBox(width: screenWidth * 0.02),
                                  OnHoverButton(
                                  builder: ((isHovered) {
                                    final color =isHovered ? Colors.black : Colors.black;
                                    return OutlinedButton(  
                                      style: OutlinedButton.styleFrom(
                                        side:BorderSide(color: Colors.blue,width: 1),
                                        shape: StadiumBorder(),
                                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.017, vertical: screenWidth *0.017)
                                      ),
                                      onPressed: (){
                                 
                                      }, child: Text(
                                        'Photography',style: TextStyle(
                                          fontSize: screenWidth * 0.015,
                                          color: color,
                                        ),
                                     ));
                                  }), 
                                 ),
                                 SizedBox(width: screenWidth * 0.02),
                                  OnHoverButton(
                                  builder: ((isHovered) {
                                    final color =isHovered ? Colors.black : Colors.black;
                                    return OutlinedButton(  
                                      style: OutlinedButton.styleFrom(
                                        side:BorderSide(color: Colors.blue,width: 1),
                                        shape: StadiumBorder(),
                                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.017, vertical: screenWidth *0.017)
                                      ),
                                      onPressed: (){
                                 
                                      }, child: Row(
                                        children: [
                                          Text(
                                            '3D Priniting Concept',style: TextStyle(
                                              fontSize: screenWidth * 0.015,
                                              color: color,
                                            ),
                                     ),
                                        ],
                                      ));
                                  }), 
                                 ),
                                 Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.yellow,
                                  )
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),
                       SizedBox(height: screenWidth * 0.07),
                       Center(child: Text('Recent Course', style: 
                       TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold),)),

                        SizedBox(height: screenWidth * 0.07),
                 Center(
                   child: Container(
                    width: screenWidth * 0.75,
                    height: screenWidth * 0.5,
                     child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: gridmap.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: screenWidth * 0.02,
                        mainAxisSpacing: screenWidth * 0.02
                        ),
                      itemBuilder: (context, index){
                         return GestureDetector(
                           child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                             child: Card(
                              elevation: 5,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                      child: Padding(
                                        padding:  EdgeInsets.fromLTRB(screenWidth * 0.005,0,0,0),
                                        child: Text( "${gridmap.elementAt(index)['title']}",
                                        style: TextStyle(fontSize: screenWidth * 0.01,
                                        fontWeight: FontWeight.bold
                                        ),
                                        ),
                                      ),),
                                      
                             
                                      Expanded(
                                        flex: 3,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(screenWidth * 0.016),
                                            topRight: Radius.circular(screenWidth * 0.016)
                                            ),
                                          child: Image.network(
                                            "${gridmap.elementAt(index)['images']}",
                                             fit: BoxFit.cover,
                                             height: screenWidth * 0.08,
                                             width: screenWidth * 0.07,
                                          )
                                          ),
                                      ),
                                     
                                    ],
                                  ),
                                  Container(
                                    color: Colors.red,
                                    child: SizedBox(
                                      height: screenWidth * 0.01,
                                    ),
                                  ),
                                   Expanded(
                                     child: SizedBox(
                                       height: screenWidth * 0.1,
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.fromLTRB(4, 0 , 4 , 0),
                                     child: Text( "${gridmap.elementAt(index)['titles']}", style: TextStyle(
                                      fontSize: screenWidth * 0.011,
                                      fontWeight: FontWeight.bold
                                     ),),
                                   ),
                                   SizedBox(height: screenWidth * 0.01,),
                                   Text('Free', style: TextStyle(fontSize: screenWidth * 0.01, fontWeight: FontWeight.bold)),
                                ],
                              ),
                             ),
                           ),
                         );
                     }
                     ),
                   ),
                 ),

                Container(
                  width: screenWidth,
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(screenWidth * 0.1, 0 , screenWidth * 0.1,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                     Column(children: [
                       Text('About', style:  TextStyle(
                        fontSize: screenWidth * 0.020,
                        fontWeight: FontWeight.bold,
                       ),
                       ),
                       SizedBox(height: screenWidth * 0.01,),
                       Text('DanEnergy Training Center  is an online platform that offers training,\n job opportunities, and coaching resources to help young people\n develop their mindsets and soft skills,\n and succeed in their careers.',
                       style: TextStyle(
                        fontSize: screenWidth * 0.011,
                        color: Colors.grey,
                       )
                       )
                     ],),
                    
                    
                            Column(
                            children: [
                          Text('Contact', style:
                          TextStyle(
                            fontSize: screenWidth * 0.020, 
                            fontWeight: FontWeight.bold
                            )),
                            SizedBox(height: screenWidth * 0.01,),
                            Text('2nd Floor, CMC Mikaeal next to NOC, A.A',
                            style: TextStyle(
                        fontSize: screenWidth * 0.011,
                        color: Colors.grey,
                       )
                            ),
                    ],
                                 ),
                    
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text('Page', style: TextStyle(fontSize: screenWidth * 0.020, fontWeight: FontWeight.bold)),
                      SizedBox(height: screenWidth * 0.01,),
                      TextButton(
                        onPressed:() {
                          
                        },
                        child: Text('Home'
                        ,
                            style: TextStyle(
                        fontSize: screenWidth * 0.011,
                        color: Colors.grey,
                       ))
                        ),
                      TextButton(
                        onPressed:() {
                          
                        },
                        child: Text('About Us',
                            style: TextStyle(
                        fontSize: screenWidth * 0.011,
                        color: Colors.grey,
                       ))),
                      TextButton(
                        onPressed:() {
                          
                        },
                        child: Text('Course',
                            style: TextStyle(
                        fontSize: screenWidth * 0.011,
                        color: Colors.grey,
                       ))),
                      TextButton(
                        onPressed:() {
                          
                        },
                        child: Text('Blogs',
                            style: TextStyle(
                        fontSize: screenWidth * 0.011,
                        color: Colors.grey,
                       ))),
                      TextButton(
                        onPressed:() {
                          
                        },
                        child: Text('Contact Us',
                            style: TextStyle(
                        fontSize: screenWidth * 0.011,
                        color: Colors.grey,
                       ))),
                       ],
                       ),
                       ],
                       ),
                  ),
                ),

                   SizedBox(height: screenWidth * 0.05,)  
                ],  
          ),

        ),
      ),
    );
  }
Widget buildImage(String urlImage, int index,List<String> displayText) =>
    Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
              child: Row(
                children: [
                  Image.network(
                    urlImage,
                    fit: BoxFit.cover,
                  ),
                ],
              )),
        ),
         Expanded(
          flex: 1,
            child: Container(
            color: Colors.white,
            width: 200,
             height: 200,
             child: Stack(
              children: [
                Text('$displayText[$index]', style: TextStyle(
                  fontSize: 23
                ),)
              ],
             )
             ),
          ),
       
      ],
    );

    Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex, 
      count: urlImages.length,
      effect: JumpingDotEffect(
        dotWidth: 10,
        dotHeight: 10,
        activeDotColor: Colors.green,
        dotColor: Colors.grey,
      ),
      
      );

    
}


