import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Learning Home',
      home: Scaffold(
        appBar: AppBar(
          title: Text('E-Learning Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Handle search button press
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notifications button press
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Handle settings button press
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header section with logo and welcome message
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 100,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Welcome to E-Learning!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Featured courses section with horizontal scrollable list
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Featured Courses',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          // Replace these placeholders with actual course cards
                          Container(
                            width: 150,
                            margin: EdgeInsets.only(right: 8),
                            color: Colors.grey[300],
                          ),
                          Container(
                            width: 150,
                            margin: EdgeInsets.only(right: 8),
                            color: Colors.grey[300],
                          ),
                          Container(
                            width: 150,
                            margin: EdgeInsets.only(right: 8),
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Categories section with vertical grid of icons
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        // Replace these placeholders with actual category icons and labels
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.computer),
                              SizedBox(height: 8),
                              Text('Technology'),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.language),
                              SizedBox(height: 8),
                              Text('Languages'),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.music_note),
                              SizedBox(height: 8),
                              Text('Music'),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.brush),
                              SizedBox(height: 8),
                              Text('Art'),
                            ],
                          ),
                        ),
                                                Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.book),
                              SizedBox(height: 8),
                              Text('Literature'),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.fitness_center),
                              SizedBox(height: 8),
                              Text('Fitness'),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt),
                              SizedBox(height: 8),
                              Text('Photography'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Popular courses section with vertical list
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Popular Courses',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Replace these placeholders with actual course cards
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 8),
                      color: Colors.grey[300],
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.all(8),
                            color: Colors.grey[400],
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Course Title',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Instructor Name',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star_half, color: Colors.yellow),
                                      SizedBox(width: 8),
                                      Text(
                                        '4.5 (500 ratings)',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 8),
                      color: Colors.grey[300],
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.all(8),
                            color: Colors.grey[400],
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Course Title',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Instructor Name',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star_half, color: Colors.yellow),
                                      Icon(Icons.star_border, color: Colors.yellow),
                                      SizedBox(width                                  : 8),
                                  Text(
                                    '3.5 (200 ratings)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 8),
                  color: Colors.grey[300],
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.all(8),
                        color: Colors.grey[400],
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Course Title',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Instructor Name',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star_border, color: Colors.yellow),
                                  Icon(Icons.star_border, color: Colors.yellow),
                                  SizedBox(width: 8),
                                  Text(
                                    '3.0 (100 ratings)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);
  }
  }


                         
