import 'package:flutter/material.dart';
import 'package:hackedapp/pages/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WelcomePage(),
  ));
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSignInPage(),
    );
  }

  Widget buildSignInPage() {
    return Stack(
      children: [
        buildImageContainer("img/4.jpg"),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 280),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpApp()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(170, 89, 89, 142),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginApp()),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImageContainer(String imagePath) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData.dark(), // Set the theme to dark mode
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 200),
                Text(
                  'Login',
                  style: TextStyle(fontSize: 36, color: Colors.white),
                ),
                SizedBox(height: 24.0),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    print('Username: $username');
                    print('Password: $password');
                    // Navigate to the home page after successful login
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Up',
      theme: ThemeData.dark(), // Set the theme to dark mode
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/signup_background.jpg'), // Add your image path here
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold, // Set the fontWeight to FontWeight.bold
              ),
            ),
            SizedBox(height: 20),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  String name = _nameController.text;
                  String username = _usernameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  print('Name: $name');
                  print('Username: $username');
                  print('Email: $email');
                  print('Password: $password');
                  // Navigate to the home page after successful sign up
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                }
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
