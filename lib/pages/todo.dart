import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hackedapp/pages/calender.dart';
import 'package:hackedapp/pages/community.dart';
import 'package:hackedapp/pages/dashboard.dart';
// import 'package:hackedapp/pages/todo.dart';
import 'package:hackedapp/pages/home.dart';

// Model
class ToDo {
  String? id;
  String todoText;
  bool isDone;

  ToDo({
    this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Practice Maths', isDone: true),
      ToDo(id: '02', todoText: 'Do Dishes'),
      ToDo(id: '03', todoText: 'Physics DPP', isDone: true),
    ];
  }
}

// Constants
const Color tdRed = Color(0xFFDA4040);
const Color tdBlue = Color(0xFF5F52EE);
const Color tdPurple = Color(0xFF5F52EE);

const Color tdBlack = Color.fromARGB(255, 0, 0, 0);
const Color tdGrey = Color(0xFF717171);

const Color tdBGColor = Color.fromARGB(255, 0, 0, 0);
const Color tdBoxColor = Color.fromARGB(255, 52, 49, 53);
const Color tdtextColor = Color.fromARGB(255, 252, 251, 246);
const Color tdtickColor = Color.fromARGB(255, 167, 142, 230);

// ToDoItem Widget
class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final Function(ToDo) onToDoChanged;
  final Function(String) onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: tdBlack,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdtickColor,
        ),
        title: Text(
          todo.todoText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: tdtextColor,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
            decorationColor: todo.isDone ? tdtextColor : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.grey,
            iconSize: 25,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id!);
            },
          ),
        ),
      ),
    );
  }
}

// Home Widget
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: tdGrey,
                size: 32,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: tdGrey,
                size: 32,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: tdtextColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: tdBlack,
                        size: 20,
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        minWidth: 25,
                      ),
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: tdGrey),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          'Tasks',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: tdtextColor,
                          ),
                        ),
                      ),
                      for (ToDo todo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: tdtextColor,
                      boxShadow: const [
                        BoxShadow(
                          color: tdBoxColor,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Add a new task',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                        color: tdBlack,
                      ),
                    ),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdtextColor,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
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
  index: 3,
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

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) =>
              item.todoText.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
