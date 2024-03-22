// import 'package:calender/ui/theme.dart';
// import 'package:calender/ui/widgets/input_feild.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
// import 'package:hackedapp/pages/calender.dart';
import 'package:hackedapp/pages/community.dart';
import 'package:hackedapp/pages/dashboard.dart';
import 'package:hackedapp/pages/todo.dart';
import 'package:hackedapp/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Calender(),
    );
  }
}

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
     bottomNavigationBar: CurvedNavigationBar(
  backgroundColor: Colors.transparent,
  buttonBackgroundColor: Color.fromARGB(255, 78, 78, 78),
  color: Color.fromARGB(255, 78, 78, 78),
  animationDuration: Duration(milliseconds: 300),
  height: 60,
  index: 1,
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

      body: Column(children: [
        _addTaskbar(),
        _addDateBar(),
      ]),
    );
  }

  _addDateBar() {
    return Container(
        margin: const EdgeInsets.only(top: 20, left: 20),
        child: DatePicker(
          DateTime.now(),
          height: 103,
          width: 80,
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.deepPurple,
          selectedTextColor: Colors.white,
          dayTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          dateTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          monthTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          onDateChange: (date) {
            _selectedDate = date;
          },
        ));
  }

  _addTaskbar() {
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  "Today",
                  style: HeadingStyle,
                )
              ],
            )),
            MyButton(label: "+Add Task") // Using CustomButton instead of Button
          ],
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black, // Assuming tdBGColor is defined elsewhere
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // IconButton(
          //   icon: Icon(
          //     Icons.account_circle,
          //     color: Colors.grey, // Assuming tdGrey is defined elsewhere
          //     size: 32,
          //   ),
          //   onPressed: () {
          //     // Add onPressed logic
          //   },
          // ),
          // IconButton(
          //   icon: Icon(
          //     Icons.notifications,
          //     color: Colors.grey, // Assuming tdGrey is defined elsewhere
          //     size: 32,
          //   ),
          //   onPressed: () {
          //     // Add onPressed logic
          //   },
          // ),
        ],
      ),
    );
  }
}

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm:a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];
  int _selectColor = 0;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar2(),
      body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Task",
                style: HeadingStyle,
              ),
              MyInputFeild(
                title: "Title",
                hint: "Enter your title",
                controller: _titleController,
              ),
              MyInputFeild(
                title: "Note",
                hint: "Enter your note",
                controller: _noteController,
              ),
              MyInputFeild(
                  title: "Date",
                  hint: DateFormat.yMd().format(_selectedDate),
                  widget: IconButton(
                    icon: Icon(Icons.calendar_today_outlined),
                    onPressed: () {
                      _getDateFromUser();
                    },
                  )),
              Row(children: [
                Expanded(
                    child: MyInputFeild(
                  title: "Start Time",
                  hint: _startTime,
                  widget: IconButton(
                    icon: Icon(Icons.access_time_rounded),
                    onPressed: () {
                      _getTimeFromUser(isStartTime: true);
                    },
                  ),
                )),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: MyInputFeild(
                  title: "End TIme",
                  hint: _endTime,
                  widget: IconButton(
                    icon: Icon(Icons.access_time_rounded),
                    onPressed: () {
                      _getTimeFromUser(isStartTime: false);
                    },
                  ),
                )),
              ]),
              MyInputFeild(
                  title: "Remind",
                  hint: "$_selectedRemind minutes early",
                  widget: DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    iconSize: 32,
                    elevation: 4,
                    style: SubTitleStyle,
                    items:
                        remindList.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRemind = int.parse(newValue!);
                      });
                    },
                  )),
              MyInputFeild(
                  title: "Repeat",
                  hint: "$_selectedRepeat ",
                  widget: DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    iconSize: 32,
                    elevation: 4,
                    style: SubTitleStyle,
                    items: repeatList
                        .map<DropdownMenuItem<String>>((String? value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRepeat = newValue!;
                      });
                    },
                  )),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPallete(),
                  MyButton2(
                    label: "Create Task",
                    onTap: _validateData,
                  )
                ],
              )
            ],
          ))),
    );
  }

  _validateData() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      ///add data to database
      Navigator.pop(context);
    }
  }

  _colorPallete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: titleStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Wrap(
          children: List<Widget>.generate(3, (int index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectColor = index;
                  });
                },
                child: Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: CircleAvatar(
                      child: _selectColor == index
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 16,
                            )
                          : Container(),
                      radius: 14,
                      backgroundColor: index == 0
                          ? Color.fromARGB(255, 152, 111, 223)
                          : index == 1
                              ? Color.fromARGB(255, 232, 141, 45)
                              : Color.fromARGB(255, 219, 53, 97),
                    )));
          }),
        )
      ],
    );
  }

  AppBar _buildAppBar2() {
    return AppBar(
      backgroundColor: Colors.black, // Assuming tdBGColor is defined elsewhere
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: EdgeInsets.only(left: 290),
            icon: Icon(
              Icons.notifications,
              color: Colors.grey, // Assuming tdGrey is defined elsewhere
              size: 30,
            ),
            onPressed: () {
              // Add onPressed logic for notifications icon
            },
          ),
        ],
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print("It's a null or something is worng");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker(); // Await the result
    if (pickedTime == null) {
      print("Time canceled");
    } else {
      String formatTime = pickedTime.format(context);
      if (isStartTime == true) {
        setState(() {
          _startTime = formatTime;
        });
      } else if (isStartTime == false) {
        setState(() {
          _endTime = formatTime;
        });
      }
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }
}

class MyButton extends StatelessWidget {
  final String label;

  const MyButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddTaskPage()),
        );
      },
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepPurple,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class MyButton2 extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton2({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepPurple,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class MyInputFeild extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputFeild(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleStyle,
            ),
            Container(
                height: 52,
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: widget == null ? false : true,
                      autofocus: false,
                      cursorColor: Colors.grey[100],
                      controller: controller,
                      style: SubTitleStyle,
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: SubTitleStyle,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 0)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 0)),
                      ),
                    ),
                  ),
                  widget == null
                      ? Container()
                      : Container(
                          child: widget,
                        )
                ]))
          ],
        ));
  }
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.grey[600],
  ));
}

TextStyle get HeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  ));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ));
}

TextStyle get SubTitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[100]));
}
