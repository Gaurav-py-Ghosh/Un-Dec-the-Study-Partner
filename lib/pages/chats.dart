import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(), // Enable dark mode
    home: ChatScreen(),
  ));
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Handle profile tap
              },
            ),
            SizedBox(width: 8), // Add spacing between icon and title
            Text('Chat App'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification bell tap
            },
          ),
        ],
      ),
      body: Row(
        children: [
          SizedBox(
            width: 80, // Adjust the width as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8), // Add spacing
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    // Placeholder image, replace with actual profile image
                    backgroundImage: AssetImage('assets/profile_image.png'),
                  ),
                ),
                SizedBox(height: 20), // Add spacing
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Notification Bell'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      // Handle notification bell tap
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      // Handle search input
                      // Filter the chat list based on the search query
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('All Chats'),
                      Text('Unread'),
                      Text('Important'),
                      Text('Read'),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10, // Assuming 10 chats for demo
                    itemBuilder: (BuildContext context, int index) {
                      // Replace this with your chat item widget
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          // Placeholder image, replace with actual profile image
                          backgroundImage: AssetImage('assets/profile_image.png'),
                        ),
                        title: Text('Chat $index'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
