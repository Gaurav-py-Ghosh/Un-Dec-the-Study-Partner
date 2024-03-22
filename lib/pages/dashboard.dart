import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:hackedapp/pages/profile.dart';
import 'package:hackedapp/pages/calender.dart';
import 'package:hackedapp/pages/community.dart';
// import 'package:hackedapp/pages/dashboard.dart';
import 'package:hackedapp/pages/todo.dart';
import 'package:hackedapp/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stats Page',
      theme: ThemeData.dark(),
      home: StatsPage(),
    );
  }
}

class StatsPage extends StatelessWidget {
  final List<double> thisWeekData = List.generate(7, (index) {
    double randomValue = Random().nextInt(2) + 5;
    return randomValue + Random().nextDouble() * 0.5 - 0.25;
  });

  final List<double> lastWeekData = List.generate(7, (index) {
    double randomValue = Random().nextInt(2) + 5;
    return randomValue + Random().nextDouble() * 0.5 - 0.25;
  });

  final List<Badge> badges = [
    Badge(name: 'Regular Studier', icon: Icons.star, color: Colors.yellow),
    Badge(name: 'Focused Learner', icon: Icons.school, color: Colors.blue),
    Badge(name: 'Dedicated Student', icon: Icons.done, color: Colors.green),
    Badge(name: 'Knowledge Seeker', icon: Icons.lightbulb, color: Colors.orange),
    Badge(name: 'Study Champion', icon: Icons.emoji_events, color: Colors.purple),
    Badge(name: 'Top Performer', icon: Icons.trending_up, color: Colors.red),
    Badge(name: 'Super Scholar', icon: Icons.library_books, color: Colors.teal),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the Stack with SingleChildScrollView
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: kToolbarHeight + 60),
                  Text(
                    'Statistics Overview',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        height: 200,
                        child: LineChartSample2(
                          thisWeekData: thisWeekData,
                          lastWeekData: lastWeekData,
                          lastWeekAverage: calculateAverage(lastWeekData),
                        ),
                      ),
                      SizedBox(height: 20),
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                'Average Hours Studied:',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${calculateAverage(thisWeekData).toStringAsFixed(1)} hours',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Badges',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  AnimatedBadgeGrid(badges: badges),
                  SizedBox(height: 20),
                  Text(
                    'Heatmap Calendar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Add heatmap calendar below the badges
                  MyHeatMap(),
                  SizedBox(height: 100), // Extra space to ensure the heatmap is fully visible
                ],
              ),
            ),
            Positioned(
              top: 60,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
           Positioned(
  top: 60,
  right: 30,
  child: IconButton(
    onPressed: () {
      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfileScreen()),
  );
      // Add your onPressed logic here
    },
    icon: CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Icon(Icons.person, color: Colors.white),
    ),
  ),
),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
  backgroundColor: Colors.transparent,
  buttonBackgroundColor: Color.fromARGB(255, 78, 78, 78),
  color: Color.fromARGB(255, 78, 78, 78),
  animationDuration: Duration(milliseconds: 300),
  height: 60,
  index: 4,
  items: [
    GestureDetector(
      onTap: () {
         Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => comms()),
  );

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
         Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyHomePage()),
  );
        // Handle tap for the third icon
        // Navigate or perform desired action
      },
      child: Icon(Icons.home_filled, color: Colors.grey, size: 30),
    ),
    GestureDetector(
      onTap: () {
         Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Home()),
  );
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

  double calculateAverage(List<double> data) {
    double sum = data.reduce((a, b) => a + b);
    return sum / data.length;
  }
}

class Badge {
  final String name;
  final IconData icon;
  final Color color;

  Badge({required this.name, required this.icon, required this.color});
}

class BadgeWidget extends StatefulWidget {
  final Badge badge;

  const BadgeWidget({Key? key, required this.badge}) : super(key: key);

  @override
  _BadgeWidgetState createState() => _BadgeWidgetState();
}

class _BadgeWidgetState extends State<BadgeWidget> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _pressed = !_pressed;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: _pressed ? widget.badge.color.withOpacity(0.8) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.badge.icon, color: Colors.white),
            if (_pressed) SizedBox(width: 4),
            if (_pressed)
              Text(
                widget.badge.name,
                style: TextStyle(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}

class LineChartSample2 extends StatelessWidget {
  final List<double> thisWeekData;
  final List<double> lastWeekData;
  final double lastWeekAverage;

  const LineChartSample2({
    required this.thisWeekData,
    required this.lastWeekData,
    required this.lastWeekAverage,
  });

  @override
  Widget build(BuildContext context) {
    double difference = calculateDifference(thisWeekData, lastWeekAverage);
    IconData arrowIcon = difference >= 0 ? Icons.arrow_upward : Icons.arrow_downward;
    Color arrowColor = difference >= 0 ? Colors.green : Colors.red;

    int minIndex = thisWeekData.indexOf(thisWeekData.reduce(min));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.of(context).size.width * 1.5,
        height: 250,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    arrowIcon,
                    color: arrowColor,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Difference from last week: ${(difference).toStringAsFixed(1)} hours',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            Expanded(
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: thisWeekData.asMap().entries.map((entry) {
                        Color spotColor = entry.key == minIndex ? Colors.red : Colors.deepPurple;
                        return MyFlSpot(entry.key.toDouble(), entry.value, spotColor);
                      }).toList(),
                      isCurved: true,
                      colors: [Colors.deepPurple.withOpacity(0.8)],
                      barWidth: 4,
                      belowBarData: BarAreaData(show: false),
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                          radius: 4,
                          strokeWidth: 2,
                          color: Colors.deepPurple,
                          strokeColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                  borderData: FlBorderData(show: true),
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 8,
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (value) => const TextStyle(color: Colors.white),
                      getTitles: (value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'Mon';
                          case 1:
                            return 'Tue';
                          case 2:
                            return 'Wed';
                          case 3:
                            return 'Thu';
                          case 4:
                            return 'Fri';
                          case 5:
                            return 'Sat';
                          case 6:
                            return 'Sun';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (value) => const TextStyle(color: Colors.white),
                      getTitles: (value) {
                        return value.toInt().toString();
                      },
                    ),
                  ),
                  gridData: FlGridData(show: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateDifference(List<double> data, double lastWeekAverage) {
    double sum = data.reduce((a, b) => a + b);
    double average = sum / data.length;
    return average - lastWeekAverage;
  }
}

class MyFlSpot extends FlSpot {
  final Color color;

  MyFlSpot(double x, double y, this.color) : super(x, y);
}

class AnimatedBadgeGrid extends StatefulWidget {
  final List<Badge> badges;

  const AnimatedBadgeGrid({Key? key, required this.badges}) : super(key: key);

  @override
  _AnimatedBadgeGridState createState() => _AnimatedBadgeGridState();
}

class _AnimatedBadgeGridState extends State<AnimatedBadgeGrid> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Wrap(
        spacing: 10,
        children: widget.badges
            .map((badge) => FadeTransition(
                  opacity: _animation,
                  child: BadgeWidget(badge: badge),
                ))
            .toList(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class MyHeatMap extends StatelessWidget {
  const MyHeatMap({Key? key});

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      defaultColor: Colors.white,
      size: 40,
      textColor: Color.fromARGB(255, 148, 148, 148),
      colorMode: ColorMode.opacity,
      showText: true,
      scrollable: true,
      datasets: {
        DateTime(2024, 2, 21): 1,
        DateTime(2024, 2, 22): 2,
        DateTime(2024, 2, 23): 3,
        DateTime(2024, 2, 24): 4,
        DateTime(2024, 2, 26):1,
        DateTime(2024, 2, 27):2,
        DateTime(2024, 2, 29):1,
        DateTime(2024, 3, 1):2,
        DateTime(2024, 3, 2):3,
      },
      startDate: DateTime(2024, 2, 20),
      endDate: DateTime(2024, 2, 20).add(Duration(days: 40)),
      colorsets: {
        1: Color.fromARGB(100, 255, 102, 0),
        3: Color.fromARGB(120, 255, 102, 0),
        5: Color.fromARGB(130, 255, 102, 0),
        7: Color.fromARGB(140, 255, 102, 0),
        13: Color.fromARGB(150, 255, 102, 0),
        17: Color.fromARGB(160, 255, 102, 0),
        20: Color.fromARGB(170, 255, 102, 0),
        23: Color.fromARGB(200, 255, 102, 0),
        27: Color.fromARGB(220, 255, 102, 0),
        30: Color.fromARGB(255, 255, 102, 0),
      },
      // onClick: (value) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
    
    );
  }
}
