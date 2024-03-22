import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hackedapp/pages/calender.dart';
// import 'package:hackedapp/pages/community.dart';
import 'package:hackedapp/pages/dashboard.dart';
import 'package:hackedapp/pages/todo.dart';
// import 'calender.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'img/maths.jpg',
      'img/physics.jpg',
      'img/biology.jpg',
      'img/chem.jpg',
      // Add more image paths here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              // child: IconButton(
              //   icon: Icon(Icons.account_circle),
              //   iconSize: 32,
              //   onPressed: () {
              //     // Add your profile icon functionality here
              //   },
              // ),
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              iconSize: 32,
              onPressed: () {
                // Add your notification icon functionality here
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 250.0, // Fixed height for the carousel
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 250.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false, // Manual control
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: imagePaths.map((String imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            imagePath,
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(imagePaths.length, (index) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Color.fromARGB(255, 63, 62, 62)
                              : Colors.grey.withOpacity(0.5), // Change color based on current page
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0), // Add space between carousel and tasks
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Tasks',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider( // Add divider between images and tasks
            color: Colors.grey,
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(height: 10.0), // Add small space between "Tasks" and the list
          Expanded(
            child: ListView.builder(
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Task ${index + 1}'),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
  backgroundColor: Colors.transparent,
  buttonBackgroundColor: Color.fromARGB(255, 78, 78, 78),
  color: Color.fromARGB(255, 78, 78, 78),
  animationDuration: Duration(milliseconds: 300),
  height: 60,
  index: 2,
  items: [
    GestureDetector(
      onTap: () {

        // Handle tap for the first icon
        // Navigate or perform desired action
      },
      child: Icon(Icons.video_camera_front_sharp, color: Colors.grey, size: 30),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Calender()),
  );
        // Handle tap for the second icon
        // Navigate or perform desired action
      },
      child: Icon(Icons.calendar_month_rounded, color: Colors.grey, size: 30),
    ),
    GestureDetector(
      onTap: () {
        // Handle tap for the third icon
        // Navigate or perform desired action
      },
      child: Icon(Icons.home_filled, color: Colors.grey, size: 30),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),);
        // Handle tap for the fourth icon
        // Navigate or perform desired action
      },
      child: Icon(Icons.task, color: Colors.grey, size: 30),
    ),
    GestureDetector(
      onTap: () {
       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => StatsPage()),
  );
      },
      child: Icon(Icons.dashboard_customize, color: Colors.grey, size: 30),
    ),
  ],
  onTap: (index) {
    // Handle navigation bar item taps
  },
),

    );
  }
}
