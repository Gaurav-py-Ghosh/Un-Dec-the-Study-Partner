import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:hackedapp/pages/calender.dart';
// import 'package:hackedapp/pages/community.dart';
import 'package:hackedapp/pages/dashboard.dart';
import 'package:hackedapp/pages/todo.dart';
import 'package:hackedapp/pages/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF212121),
          elevation: 0,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      title: 'New WhatsApp UI',
      home: const comms(),
    );
  }
}

class comms extends StatefulWidget {
  const comms({Key? key}) : super(key: key);

  @override
  State<comms> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<comms> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  String _currentFilter = "All Chats";
  List<ConversationRow> conversations = [
    ConversationRow(name: 'Gaurav', message: 'Hi!', filename: 'bmu.png', msgCount: 0),
    ConversationRow(name: 'Syna', message: 'Hi!', filename: 'bmu.png', msgCount: 2),
    ConversationRow(name: 'JEE25', message: 'What Dpp to solve next?', filename: 'grp.jpg', msgCount: 6),
    ConversationRow(name: 'Lakshay', message: 'Hi!', filename: 'bmu.png', msgCount: 0),
    ConversationRow(name: 'Preet', message: 'Hi!', filename: 'bmu.png', msgCount: 3),
    ConversationRow(name: 'Math Maniacs', message: 'Hi!', filename: 'grp.jpg', msgCount: 0),
    ConversationRow(name: 'Aditya', message: 'Hi!', filename: 'bmu.png', msgCount: 0),
    ConversationRow(name: 'Akshita', message: 'Hi!', filename: 'bmu.png', msgCount: 0),
  ];

  @override
  Widget build(BuildContext context) {
    var column = Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 56,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: const [
                        UserAvatar(filename: 'img3.jpeg'),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Tom Brenan',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const DrawerItem(
                      title: 'Account',
                      icon: Icons.key,
                    ),
                    const DrawerItem(title: 'Chats', icon: Icons.chat_bubble),
                    const DrawerItem(
                        title: 'Notifications', icon: Icons.notifications),
                    const DrawerItem(
                        title: 'Data and Storage', icon: Icons.storage),
                    const DrawerItem(title: 'Help', icon: Icons.help),
                    const Divider(
                      height: 35,
                      color: Colors.green,
                    ),
                    const DrawerItem(
                        title: 'Invite a friend', icon: Icons.people_outline),
                  ],
                ),
                const DrawerItem(title: 'Log out', icon: Icons.logout)
              ],
            );
    return Scaffold(
      key: _globalKey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      _globalKey.currentState!.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                  IconButton(
                    onPressed: () async {
                      final searchQuery = await showSearch<String>(
                        context: context,
                        delegate: CustomSearchDelegate(conversations: conversations),
                      );
                      if (searchQuery != null) {
                        setState(() {
                          // Handle the search query result
                          print('Search Query: $searchQuery');
                        });
                      }
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10),
                children: [
                  buildOptionButton("Unread", 12),
                  buildOptionButton("All Chats", 12),
                  buildOptionButton("Groups", 12),
                  buildOptionButton("Friends", 12),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Color(0xFF212121),
                ),
                child: ListView(
                  padding: const EdgeInsets.only(left: 25),
                  children: conversations
                      .where((conversation) {
                        // Filter conversations based on the selected filter
                        if (_currentFilter == "Unread") {
                          return conversation.msgCount > 0;
                        } else if (_currentFilter == "Groups") {
                          return conversation.name == "JEE25" || conversation.name == "Math Maniacs";
                        } else if (_currentFilter == "Friends") {
                          return !conversation.name.startsWith("Group");
                        } else {
                          return true; // Show all chats
                        }
                      })
                      .map((conversation) => buildConversationRow(conversation))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          backgroundColor: Color(0xFF212121),
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
           Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => CreateServer()),
);

            // Handle floating action button press (for example, create new chat)
          },
        ),
      ),
      drawer: Drawer(
        width: 275,
        elevation: 30,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(40)),
            color: Color(0xFF171717),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: column,
          ),
        ),
      ),
       bottomNavigationBar: CurvedNavigationBar(
  backgroundColor: Colors.transparent,
  buttonBackgroundColor: Color.fromARGB(255, 78, 78, 78),
  color: Color.fromARGB(255, 78, 78, 78),
  animationDuration: Duration(milliseconds: 300),
  height: 60,
  index: 0,
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

  Widget buildOptionButton(String text, double fontSize) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            _currentFilter = text;
          });
        },
        child: Text(
          text,
          style: TextStyle(
            color: _currentFilter == text ? Color.fromARGB(255, 49, 49, 49) : Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }

  Widget buildConversationRow(ConversationRow conversation) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Handle conversation tap
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  UserAvatar(filename: conversation.filename),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        conversation.name,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        conversation.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, top: 5),
                child: Column(
                  children: [
                    const Text(
                      '16:35',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (conversation.msgCount > 0)
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.white,
                        child: Text(
                          conversation.msgCount.toString(),
                          style: const TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
        const Divider(
          indent: 70,
          height: 20,
        )
      ],
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawerItem({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String filename;
  const UserAvatar({
    Key? key,
    required this.filename,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 29,
        backgroundImage: AssetImage('assets/images/$filename'),
      ),
    );
  }
}

class ConversationRow {
  final String name;
  final String message;
  final String filename;
  final int msgCount;
  const ConversationRow({
    required this.name,
    required this.message,
    required this.filename,
    required this.msgCount,
  });
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<ConversationRow> conversations;

  CustomSearchDelegate({required this.conversations});

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Your search suggestions UI implementation
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Suggestion $index'),
          onTap: () {
            // Handle suggestion tapped
            close(context, 'Suggestion $index');
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Filter conversations based on the search query
    final List<ConversationRow> searchResults = _filterConversations(query);

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final conversation = searchResults[index];
        return ListTile(
          title: Text(conversation.name),
          subtitle: Text(conversation.message),
          onTap: () {
            // Handle tapping on search result
            close(context, conversation.name);
          },
        );
      },
    );
  }

  // Helper method to filter conversations based on the search query
  List<ConversationRow> _filterConversations(String query) {
    return conversations.where((conversation) => conversation.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  // @override
  Widget buildSearchBar(BuildContext context) {
    return TextField(
      onChanged: (value) {
        // Handle search query changes
      },
      onSubmitted: (value) {
        // Handle search query submission
        // This is where you would typically perform the search operation
        print('Search submitted: $value');
      },
      decoration: InputDecoration(
        hintText: 'Search...',
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }
}
