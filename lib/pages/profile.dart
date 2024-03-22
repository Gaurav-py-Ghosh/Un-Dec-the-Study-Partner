import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hackedapp/pages/dashboard.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  double buttonWidth = 120.0;
  double buttonHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true, // Allow resizing to avoid keyboard
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => StatsPage()),
  );
            // Handle back button press here
          },
        ),
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            children: [
              SizedBox(height: 0),
              Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              CircleAvatar(
                radius: 65,
                // backgroundImage: AssetImage('assets/images/user.JPG'),
              ),
              SizedBox(height: 15),
              itemProfile('Username', nameController, Icons.person),
              SizedBox(height: 5),
              itemProfile('Phone Number', phoneController, Icons.phone),
              SizedBox(height: 5),
              itemProfile("Email I'd", addressController, Icons.mail),
              SizedBox(height: 5),
              itemProfile('Password', emailController, Icons.lock_open_outlined),
              SizedBox(height: 5),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press, access entered data from text controllers
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.resolveWith(
                        (states) => Size(buttonWidth, buttonHeight)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.black.withOpacity(1.0)),
                  ),
                ),
              ),
              // SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemProfile(
      String title, TextEditingController controller, IconData iconData) {
    return Container(
      width: 370,
      height: 75,
      margin: EdgeInsets.only(left: 10, bottom: 15), // Add margin after each item
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            // offset: Offset(0, 5),
            color: Color.fromARGB(255, 228, 8, 8).withOpacity(.2),
          )
        ],
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: ListTile(
        title: Text(
          title ,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: TextField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
          ),
        ),
        leading: Icon(iconData),
        tileColor: Colors.transparent,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const ProfileScreen(),
    );
  }
}