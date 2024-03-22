import 'package:flutter/cupertino.dart';
// import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatMap extends StatelessWidget {
  const MyHeatMap({Key? key});

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      defaultColor: Colors.white,
      size: 40,
      textColor: Colors.white,
      colorMode: ColorMode.opacity,
      showText: false,
      scrollable: true,
      datasets: {
        DateTime(2024, 2, 23): 3,
        DateTime(2024, 2, 24): 7,
        DateTime(2024, 2, 25): 10,
        DateTime(2024, 2, 26): 13,
        DateTime(2024, 2, 27): 6,
      },
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 40)),
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
      onClick: (value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }
}
