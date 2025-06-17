import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: NoScrollbarScrollBehavior(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF121212),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 229, 9, 20),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white, fontFamily: "Roboto"),
          bodyText2: TextStyle(color: Colors.white70, fontFamily: "Roboto"),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedPage = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
  onTap: () {
    //transiton package faizan avatar pageoverlay Profile instead of Navigator.push(), 
    showGeneralDialog(
  context: context,
  barrierDismissible: true,
  barrierLabel: "Profile",
  transitionDuration: Duration(milliseconds: 300),
  pageBuilder: (context, anim1, anim2) {
    return Align(
      alignment: Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: 0.5, // 50% width of screen
        child: ProfileOverlayPage(), // your widget
      ),
    );
  },
  transitionBuilder: (context, anim1, anim2, child) {
    final offsetAnimation = Tween<Offset>(
      begin: Offset( -4,0),
      end: Offset(0, 0),
    ).animate(anim1);
    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  },
);
  },
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: CircleAvatar(
      backgroundImage: NetworkImage(
        "https://images.ctfassets.net/y2ske730sjqp/5QQ9SVIdc1tmkqrtFnG9U1/de758bba0f65dcc1c6bc1f31f161003d/BrandAssets_Logos_02-NSymbol.jpg?w=940",
      ),
      radius: 20,
      backgroundColor: Colors.transparent,
    ),
  ),
),

        title: Text(
          "CineVerse",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 0.1,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ScrollConfiguration(
              behavior: NoScrollbarScrollBehavior(),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    NavItem("Home", () => setState(() => selectedPage = "Home")),
                    NavItem("TV shows", () => setState(() => selectedPage = "TV shows")),
                    NavItem("Movies", () => setState(() => selectedPage = "Movies")),
                    NavItem("News & Popular", () => setState(() => selectedPage = "News & Popular")),
                    NavItem("My list", () => setState(() => selectedPage = "My list")),
                    NavItem("Trending", () => setState(() => selectedPage = "Trending")),
                    NavItem("Top 10", () => setState(() => selectedPage = "Top 10")),
                    NavItem("Downloads", () => setState(() => selectedPage = "Downloads")),
                    NavItem("+", () => setState(() => selectedPage = "+")),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  getPageContent(),
                  SizedBox(height: 50),
                  _newList(),
                  SizedBox(height: 20),
                  _newMoviesList(), // New horizontal list for new movies
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getPageContent() {
    switch (selectedPage) {
      case "Home":
        return _Home();
      case "TV shows":
        return _Tv();
      case "Movies":
        return _Mov();
      case "News & Popular":
        return _New();
      case "My list":
        return _My();
      case "Trending":
        return _Tre();
      case "Top 10":
        return _Top();
      case "Downloads":
        return _Down();
      case "+":
        return _add();
      default:
        return Center(
          child: Text(
            "Unknown Page",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        );
    }
  }
}

Widget _Home() {
  final moviePosters = [
    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/adventure-movie-poster-template-design-7b13ea2ab6f64c1ec9e1bb473f345547_screen.jpg?ts=1636999411",
    "https://i.ebayimg.com/images/g/IbQAAOSw6WFgYwiO/s-l400.jpg",
    "https://i0.wp.com/baddogposters.com/wp-content/uploads/trickrtreat0820202301.jpg?fit=800%2C1200&ssl=1",
    "https://creativereview.imgix.net/content/uploads/2024/12/AlienRomulus-scaled.jpg?auto=compress,format&q=60&w=1728&h=2560",
    "https://cdn.prod.website-files.com/6009ec8cda7f305645c9d91b/66a4263d01a185d5ea22eeec_6408f6e7b5811271dc883aa8_batman-min.png",
  ];
  return Container(
    padding: EdgeInsets.symmetric(vertical: 12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: Text(
            "Popular Movies",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "Roboto",
            ),
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviePosters.length,
            itemBuilder: (context, index) {
              return Container(
                width: 130,
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(moviePosters[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _newList() {
  final m = [
    "https://www.indiewire.com/wp-content/uploads/2019/12/us-1.jpg?w=758",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNCLI1yaQp3WzZOen5ErmVHhf11U_RQAvfSA&s",
    "https://i.ebayimg.com/images/g/vQYAAOSwEVZi1Yua/s-l1200.jpg",
    "https://upload.wikimedia.org/wikipedia/en/9/9e/Drishyam_2_2022_film_poster.jpg",
    "https://i.ebayimg.com/images/g/vF4AAOSwPzBkkuLs/s-l400.jpg",
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: Text(
          "More Movies",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: "Roboto",
          ),
        ),
      ),
      SizedBox(height: 12),
      SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: m.length,
          itemBuilder: (context, index) {
            return Container(
              width: 130,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(m[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget _newMoviesList() {
  final newMovies = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNChRf4s3x3e2CaFfdgp8Aahb6tWl6_rUC2g&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEmHN3GJj5FwwdXGRGgcobyHeF41NDMJyo7w&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH2YZtemKJZBXniqVup3cw857W_YYF1b6fxDboncVyLXVPfMVGaP8_z2wQyZYdnb3p75g&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREv5EBly30a8iyEPfnIHkXoPr_x2vxk9R45GqBjUWy6NWM64ZC4c05At6O1i_1eaUaSWI&usqp=CAU",
    "https://www.joblo.com/wp-content/uploads/2025/04/ballerina_poster_4_17_joblo.jpg",
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: Text(
          "New Movies",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: "Roboto",
          ),
        ),
      ),
      SizedBox(height: 12),
      SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: newMovies.length,
          itemBuilder: (context, index) {
            return Container(
              width: 130,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(newMovies[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget _Tv() {
  return Center(
    child: Text("TV shows", style: TextStyle(fontSize: 20, color: Colors.white)),
  );
}

Widget _Mov() {
  return Center(
    child: Text("Movies", style: TextStyle(fontSize: 20, color: Colors.white)),
  );
}

Widget _New() {
  return Center(
    child: Text("News", style: TextStyle(fontSize: 20, color: Colors.white)),
  );
}

Widget _My() {
  return Center(
    child: Text("Your list", style: TextStyle(fontSize: 20, color: Colors.white)),
  );
}

Widget _Tre() {
  return Center(
    child: Text("Trending", style: TextStyle(fontSize: 20, color: Colors.white)),
  );
}

Widget _Top() {
  return Center(
    child: Text("Top 10", style: TextStyle(fontSize: 20, color: Colors.white)),
  );
}

Widget _Down() {
  return Center(
    child: Text("Downloads", style: TextStyle(fontSize: 20, color: Colors.white)),
  );
}

Widget _add() {
  return Center(
    child: Text("Add", style: TextStyle(fontSize: 20, color: Colors.white)),
  );
}

class NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  NavItem(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
          ),
        ),
      ),
    );
  }
}

class NoScrollbarScrollBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
//layer avatar
class ProfileOverlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF121212),
      appBar: AppBar(
        title: Text("Account"),
        backgroundColor: Color.fromARGB(255, 229, 9, 20),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title: Text("Profile", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          Divider(color: Colors.grey),
          ListTile(
            leading: Icon(Icons.login, color: Colors.white),
            title: Text("Log in", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.white),
            title: Text("Sign out", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.download, color: Colors.white),
            title: Text("Downloads", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
