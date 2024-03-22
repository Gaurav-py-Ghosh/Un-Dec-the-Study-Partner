import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
// import 'package:hackedapp/pages/comm.dart';
import 'community.dart';

class DiscordListTile extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final String svgPath;
  const DiscordListTile({
    Key? key,
    required this.onTap,
    required this.title,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(
        svgPath,
      ),
      minLeadingWidth: 48,
      title: Text(
        title,
        style: GoogleFonts.openSans(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: SvgPicture.asset(
        'assets/images/chevron-right.svg',
        color: const Color(0xFFb9babe),
      ),
    );
  }
}

class RemoveScrollGlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Center(
        child: Text('This is another page'),
      ),
    );
  }
}

class CreateServer extends StatefulWidget {
  const CreateServer({Key? key});

  @override
  State<CreateServer> createState() => _CreateServerState();
}

class _CreateServerState extends State<CreateServer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 26, 26),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 72,
        leadingWidth: 48, // Increased size of the X button
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/images/close.svg',
              color: Colors.white,
              width: 32, // Adjusted width for larger size
              height: 32, // Adjusted height for larger size
            ),
            onPressed: () {
              // Navigate to another page when "X" is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => comms()),
              );
            },
          ),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: IntrinsicHeight(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.transparent
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Have an invite already?',
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Theme(
                data: ThemeData(
                  highlightColor: Colors.transparent,
                  splashColor: const Color.fromARGB(255, 94, 98, 102),
                  splashFactory: InkRipple.splashFactory,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: RawMaterialButton(
                    elevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    onPressed: () {},
                    fillColor: const Color(0xFF50555b),
                    child: Text(
                      "Join a Community",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ScrollConfiguration(
          behavior: RemoveScrollGlowBehavior(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 132),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Text(
                    "Create Your Community",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text(
                    "Your Community is where you and your friends hang out.",
                    style: GoogleFonts.openSans(
                      color: const Color(0xFFb9bbbf),
                      fontSize: 14,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Make yours and start talking.",
                    style: GoogleFonts.openSans(
                      color: const Color(0xFFb9bbbf),
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Theme(
                  data: ThemeData(
                    highlightColor: Colors.transparent,
                    splashColor: const Color.fromARGB(255, 69, 71, 76),
                    splashFactory: InkRipple.splashFactory,
                  ),
                  child: ListTileTheme(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    tileColor: const Color(0xFF2a2b2f),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DiscordListTile(
                            onTap: () {
                              Navigator.of(context).push(_nextPage());
                            },
                            title: "Create My Own",
                            svgPath: 'assets/images/create-my-own.svg'),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "START FROM A TEMPLATE",
                          style: GoogleFonts.openSans(
                            color: const Color(0xFFb9bbbf),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DiscordListTile(
                            onTap: () {
                              Navigator.of(context).push(_nextPage());
                            },
                            title: "School Club",
                            svgPath: 'assets/images/school-club.svg'),
                        const SizedBox(
                          height: 8,
                        ),
                        DiscordListTile(
                            onTap: () {
                              Navigator.of(context).push(_nextPage());
                            },
                            title: "Study Group",
                            svgPath: 'assets/images/study-group.svg'),
                        const SizedBox(
                          height: 8,
                        ),
                        DiscordListTile(
                            onTap: () {
                              Navigator.of(context).push(_nextPage());
                            },
                            title: "Friends",
                            svgPath: 'assets/images/friends.svg'),
                        const SizedBox(
                          height: 8,
                        ),
                        DiscordListTile(
                            onTap: () {
                              Navigator.of(context).push(_nextPage());
                            },
                            title: "Artists & Creators",
                            svgPath: 'assets/images/artists-creators.svg'),
                        const SizedBox(
                          height: 8,
                        ),
                        DiscordListTile(
                            onTap: () {
                              Navigator.of(context).push(_nextPage());
                            },
                            title: "Local Community",
                            svgPath: 'assets/images/local-community.svg'),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Route _nextPage() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const CreateServer2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class CreateServer2 extends StatefulWidget {
  const CreateServer2({Key? key});

  @override
  State<CreateServer2> createState() => _CreateServer2State();
}

class _CreateServer2State extends State<CreateServer2> {
  late TapGestureRecognizer tapGestureRecognizer;
  @override
  void initState() {
    super.initState();

    tapGestureRecognizer = TapGestureRecognizer()..onTap = () {};
  }

  @override
  void dispose() {
    super.dispose();
    tapGestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFF36393e),
        appBar: AppBar(
          toolbarHeight: 72,
          backgroundColor: const Color(0xFF36393e),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              Text(
                "Tell us more about your server",
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "In order to help you with your setup, is your new server for just a few friends or a larger community?",
                style: GoogleFonts.openSans(
                  color: const Color(0xFFb9bbbf),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),
              Theme(
                data: ThemeData(
                  highlightColor: Colors.transparent,
                  splashColor: const Color.fromARGB(255, 69, 71, 76),
                  splashFactory: InkRipple.splashFactory,
                ),
                child: ListTileTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  tileColor: const Color(0xFF2a2b2f),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DiscordListTile(
                          onTap: () {},
                          title: "For me and my friends",
                          svgPath: 'assets/images/local-community.svg'),
                      const SizedBox(
                        height: 8,
                      ),
                      DiscordListTile(
                          onTap: () {},
                          title: "For a club or community",
                          svgPath: 'assets/images/artists-creators.svg')
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.openSans(
                    color: const Color(0xFFb9bbbf),
                    fontSize: 14,
                  ),
                  children: [
                    const TextSpan(text: "Not sure? You can "),
                    TextSpan(
                      text: "skip this question ",
                      style: GoogleFonts.openSans(
                        color: const Color(0xFF4ba8ee),
                      ),
                      recognizer: tapGestureRecognizer,
                    ),
                    const TextSpan(text: "for now."),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discord',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF000000),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF000000),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xFF000000),
        ),
      ),
      home: const CreateServer(),
    );
  }
}
