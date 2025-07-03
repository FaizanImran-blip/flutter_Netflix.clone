import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(MyApp());
}

// Movie model
class Movie {
  final String title;
  final String imageUrl;
  final String description;
  final String duration;
  final String ageRating;
  final String releaseYear;
  final String genres;
  final List<String> cast;

  Movie({
    required this.title,
    required this.imageUrl,
    this.description = "No description available",
    this.duration = "N/A",
    this.ageRating = "N/A",
    this.releaseYear = "N/A",
    this.genres = "N/A",
    this.cast = const [],
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineVerse',
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

  final List<Movie> popularMovies = [
    Movie(
      title: "Adventure Movie",
      imageUrl: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/adventure-movie-poster-template-design-7b13ea2ab6f64c1ec9e1bb473f345547_screen.jpg?ts=1636999411",
      description: "A thrilling adventure movie that takes you around the world.",
      duration: "2h 10m",
      ageRating: "13+",
      releaseYear: "2021",
      genres: "Adventure, Action",
      cast: ["Actor A", "Actor B", "Actor C"],
    ),
    Movie(
      title: "Movie 2",
      imageUrl: "https://i.ebayimg.com/images/g/IbQAAOSw6WFgYwiO/s-l400.jpg",
      description: "Description for Movie 2",
      duration: "1h 45m",
      ageRating: "16+",
      releaseYear: "2020",
      genres: "Drama",
      cast: ["Actor X", "Actor Y"],
    ),
    Movie(
      title: "Trick 'r Treat",
      imageUrl: "https://i0.wp.com/baddogposters.com/wp-content/uploads/trickrtreat0820202301.jpg?fit=800%2C1200&ssl=1",
      description: "A horror anthology about Halloween night.",
      duration: "1h 25m",
      ageRating: "18+",
      releaseYear: "2023",
      genres: "Horror",
      cast: ["Actor Horror1", "Actor Horror2"],
    ),
    Movie(
      title: "Alien Romulus",
      imageUrl: "https://creativereview.imgix.net/content/uploads/2024/12/AlienRomulus-scaled.jpg?auto=compress,format&q=60&w=1728&h=2560",
      description: "Sci-fi thriller set on a distant alien planet.",
      duration: "1h 55m",
      ageRating: "16+",
      releaseYear: "2024",
      genres: "Sci-Fi",
      cast: ["Sci-Fi Actor1", "Sci-Fi Actor2"],
    ),
    Movie(
      title: "Batman",
      imageUrl: "https://cdn.prod.website-files.com/6009ec8cda7f305645c9d91b/66a4263d01a185d5ea22eeec_6408f6e7b5811271dc883aa8_batman-min.png",
      description: "Gotham's vigilant protector faces new enemies.",
      duration: "2h 20m",
      ageRating: "13+",
      releaseYear: "2023",
      genres: "Action, Crime",
      cast: ["Batman Actor1", "Batman Actor2"],
    ),
  ];

  final List<Movie> moreMovies = [
    Movie(
      title: "Us",
      imageUrl: "https://www.indiewire.com/wp-content/uploads/2019/12/us-1.jpg",
      description: "A family’s serene beach vacation turns to chaos.",
      duration: "1h 56m",
      ageRating: "16+",
      releaseYear: "2019",
      genres: "Horror, Thriller",
      cast: ["Lupita Nyong'o", "Winston Duke"],
    ),
    Movie(
      title: "Unknown Movie",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNCLI1yaQp3WzZOen5ErmVHhf11U_RQAvfSA&s",
      description: "A mysterious new film.",
      duration: "2h 00m",
      ageRating: "13+",
      releaseYear: "2022",
      genres: "Mystery",
      cast: ["Actor 1", "Actor 2"],
    ),
    Movie(
      title: "Classic Thriller",
      imageUrl: "https://i.ebayimg.com/images/g/vQYAAOSwEVZi1Yua/s-l1200.jpg",
      description: "Classic suspense and thrill.",
      duration: "1h 40m",
      ageRating: "PG",
      releaseYear: "2005",
      genres: "Thriller",
      cast: ["Actor A", "Actor B"],
    ),
    Movie(
      title: "Drishyam 2",
      imageUrl: "https://upload.wikimedia.org/wikipedia/en/9/9e/Drishyam_2_2022_film_poster.jpg",
      description: "A gripping sequel to the original.",
      duration: "2h 20m",
      ageRating: "13+",
      releaseYear: "2022",
      genres: "Crime, Drama",
      cast: ["Ajay Devgn", "Tabu"],
    ),
    Movie(
      title: "Retro Flick",
      imageUrl: "https://i.ebayimg.com/images/g/vF4AAOSwPzBkkuLs/s-l400.jpg",
      description: "A retro classic movie.",
      duration: "1h 50m",
      ageRating: "PG",
      releaseYear: "1990",
      genres: "Drama",
      cast: ["Actor X", "Actor Y"],
    ),
  ];

  final List<Movie> newMovies = [
    Movie(
      title: "Action Blast",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNChRf4s3x3e2CaFfdgp8Aahb6tWl6_rUC2g&s",
      description: "Non-stop action and adventure.",
      duration: "2h 10m",
      ageRating: "16+",
      releaseYear: "2025",
      genres: "Action",
      cast: ["Action Star 1", "Action Star 2"],
    ),
    Movie(
      title: "Comedy Night",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEmHN3GJj5FwwdXGRGgcobyHeF41NDMJyo7w&s",
      description: "A night full of laughs.",
      duration: "1h 30m",
      ageRating: "PG",
      releaseYear: "2025",
      genres: "Comedy",
      cast: ["Comedian 1", "Comedian 2"],
    ),
    Movie(
      title: "Epic Saga",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH2YZtemKJZBXniqVup3cw857W_YYF1b6fxDboncVyLXVPfMVGaP8_z2wQyZYdnb3p75g&usqp=CAU",
      description: "An epic journey.",
      duration: "2h 40m",
      ageRating: "13+",
      releaseYear: "2024",
      genres: "Adventure",
      cast: ["Hero 1", "Heroine 1"],
    ),
    Movie(
      title: "Romantic Escape",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREv5EBly30a8iyEPfnIHkXoPr_x2vxk9R45GqBjUWy6NWM64ZC4c05At6O1i_1eaUaSWI&usqp=CAU",
      description: "A tale of love.",
      duration: "2h 05m",
      ageRating: "PG",
      releaseYear: "2025",
      genres: "Romance",
      cast: ["Romantic Lead 1", "Romantic Lead 2"],
    ),
    Movie(
      title: "Ballerina",
      imageUrl: "https://www.joblo.com/wp-content/uploads/2025/04/ballerina_poster_4_17_joblo.jpg",
      description: "A dancer’s journey.",
      duration: "1h 45m",
      ageRating: "PG",
      releaseYear: "2025",
      genres: "Drama",
      cast: ["Dancer 1", "Dancer 2"],
    ),
  ];

  // --- NEW: TV Shows Section ---
  final List<Movie> tvShows = [
    Movie(
      title: "Stranger Things",
      imageUrl: "https://m.media-amazon.com/images/I/81SG03G+g7L.jpg",
      description: "Mystery in Hawkins.",
      duration: "4 Seasons",
      ageRating: "16+",
      releaseYear: "2016",
      genres: "Sci-Fi, Thriller",
      cast: ["Millie Bobby Brown", "Finn Wolfhard"],
    ),
    Movie(
      title: "Money Heist",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-VkG9l6g4YsmPn7vteVEAVDpneiX53rHDBzdhykf4vxAYV-yoa2JhuKWSqgN39aSrzOQ&usqp=CAU",
      description: "A criminal mastermind plans the biggest heist.",
      duration: "5 Seasons",
      ageRating: "18+",
      releaseYear: "2017",
      genres: "Crime, Drama",
      cast: ["Álvaro Morte", "Úrsula Corberó"],
    ),
    Movie(
      title: "Dark",
      imageUrl: "https://marketplace.canva.com/EAFVCFkAg3w/1/0/1131w/canva-red-and-black-horror-movie-poster-AOBSIAmLWOs.jpg",
      description: "A time-travel mystery.",
      duration: "3 Seasons",
      ageRating: "16+",
      releaseYear: "2017",
      genres: "Sci-Fi, Thriller",
      cast: ["Louis Hofmann", "Lisa Vicari"],
    ),
    Movie(
      title: "Breaking Bad",
      imageUrl: "https://flxt.tmsimg.com/assets/p185846_b_v8_aa.jpg",
      description: "A chemistry teacher turns to crime.",
      duration: "5 Seasons",
      ageRating: "18+",
      releaseYear: "2008",
      genres: "Crime, Drama",
      cast: ["Bryan Cranston", "Aaron Paul"],
    ),
    Movie(
      title: "The Witcher",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1-y3CidOjAoN7M9N5aioBr3V0l_3fTjGqg&s",
      description: "A monster hunter's journey.",
      duration: "3 Seasons",
      ageRating: "18+",
      releaseYear: "2019",
      genres: "Fantasy, Action",
      cast: ["Henry Cavill", "Anya Chalotra"],
    ),
  ];

  // --- NEW: Cartoons Section ---
  final List<Movie> cartoons = [
    Movie(
      title: "Tom & Jerry",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcQ_iBAlCi0Kdd9t33fqm7HuJOS9oa9VeaQQ&s",
      description: "Classic cartoon rivalry.",
      duration: "Various",
      ageRating: "All",
      releaseYear: "1940",
      genres: "Comedy, Animation",
      cast: ["Tom", "Jerry"],
    ),
    Movie(
      title: "SpongeBob SquarePants",
      imageUrl: "https://cdn11.bigcommerce.com/s-yzgoj/images/stencil/1280x1280/products/2867433/5922911/MOVEJ2275__28345.1679572956.jpg?c=2",
      description: "Underwater adventures in Bikini Bottom.",
      duration: "13 Seasons",
      ageRating: "All",
      releaseYear: "1999",
      genres: "Animation, Comedy",
      cast: ["SpongeBob", "Patrick"],
    ),
    Movie(
      title: "Teen Titans Go!",
      imageUrl: "https://i.ebayimg.com/images/g/S0EAAOSweGpcm8oD/s-l1200.jpg",
      description: "Superhero kids save the day.",
      duration: "7 Seasons",
      ageRating: "All",
      releaseYear: "2013",
      genres: "Animation, Action",
      cast: ["Robin", "Starfire"],
    ),
    Movie(
      title: "Avatar: The Last Airbender",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC26B4ptKbhJuIq5SD3lxVybwG29H5efZetA&s",
      description: "Aang must master all four elements.",
      duration: "3 Seasons",
      ageRating: "All",
      releaseYear: "2005",
      genres: "Animation, Adventure",
      cast: ["Aang", "Katara", "Zuko"],
    ),
    Movie(
      title: "Pokémon",
      imageUrl: "https://www.originalfilmart.com/cdn/shop/products/Pokemon_the_first_movie_1999_original_film_art_5000x.jpg?v=1572208868",
      description: "Ash and Pikachu's adventures.",
      duration: "25 Seasons",
      ageRating: "All",
      releaseYear: "1997",
      genres: "Animation, Adventure",
      cast: ["Ash", "Pikachu"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: "Profile",
              transitionDuration: Duration(milliseconds: 300),
              pageBuilder: (context, anim1, anim2) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: ProfileOverlayPage(),
                  ),
                );
              },
              transitionBuilder: (context, anim1, anim2, child) {
                final offsetAnimation = Tween<Offset>(
                  begin: Offset(-4, 0),
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
      body: SafeArea(
        child: Column(
          children: [
            // Navigation Bar
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
                    SizedBox(height:2),
                    // --- NEW: TV Shows Section ---
                    MovieSection(
                      title: "TV Shows",
                      movies: tvShows,
                      onTap: onMovieTap,
                    ),
                    SizedBox(height: 2),
                    // --- NEW: Cartoons Section ---
                    MovieSection(
                      title: "Cartoons",
                      movies: cartoons,
                      onTap: onMovieTap,
                    ),
                    SizedBox(height: 2),
                    MovieSection(
                      title: "More Movies",
                      movies: moreMovies,
                      onTap: onMovieTap,
                    ),
                    SizedBox(height: 2),
                    MovieSection(
                      title: "New Movies",
                      movies: newMovies,
                      onTap: onMovieTap,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget getPageContent() {
  switch (selectedPage) {
    case "Home":
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10), // You can reduce height from 190 to better fit
      SwipePoster(
        movies: popularMovies,
        onPageChanged: (index) {
          
        },
      ),
      SizedBox(height: 16),
      MovieSection(
        title: "Popular Movies",
        movies: popularMovies,
        onTap: onMovieTap,
      ),
    ],
  );
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

  void onMovieTap(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: movie)),
    );
  }
}
class MovieSection extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final Function(Movie) onTap;

  const MovieSection({
    required this.title,
    required this.movies,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         SizedBox(height:11),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "Roboto",
            ),
          ),
          SizedBox(height: 10), // Space between heading and posters
          SizedBox(
            height: 180, 
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: () => onTap(movie),
                  child: MoviePosterCard(
                    title: movie.title,
                    imageUrl: movie.imageUrl,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MoviePosterCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const MoviePosterCard({Key? key, required this.title, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(//bt ki thi ke mai chata hu ke mai mai chata hu ke mai yeh kam krke 
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 110,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 150,
                width: 110,
                color: Colors.grey[800],
                child: Icon(Icons.broken_image, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: "Roboto",
            ),
          ),
        ],
      ),
    );
  }
}
// Dummy widgets for other pages
Widget _Tv() => Center(child: Text("TV shows", style: TextStyle(fontSize: 20, color: Colors.white)));
Widget _Mov() => Center(child: Text("Movies", style: TextStyle(fontSize: 20, color: Colors.white)));
Widget _New() => Center(child: Text("News", style: TextStyle(fontSize: 20, color: Colors.white)));
Widget _My() => Center(child: Text("Your list", style: TextStyle(fontSize: 20, color: Colors.white)));
Widget _Tre() => Center(child: Text("Trending", style: TextStyle(fontSize: 20, color: Colors.white)));
Widget _Top() => Center(child: Text("Top 10", style: TextStyle(fontSize: 20, color: Colors.white)));
Widget _Down() => Center(child: Text("Downloads", style: TextStyle(fontSize: 20, color: Colors.white)));
Widget _add() => Center(child: Text("Add", style: TextStyle(fontSize: 20, color: Colors.white)));

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

// Profile overlay
class ProfileOverlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        title: Text("Account"),
        backgroundColor: Color.fromARGB(255, 229, 9, 20),
      ),
      body: SafeArea(
        child: ListView(
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
      ),
    );
  }
}

// Movie Detail Screen
class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  static const Color background = Color(0xFF141414);
  static const Color darkGray = Color(0xFF212121);
  static const Color lightGray = Color(0xFFB3B3B3);
  static const Color white = Colors.white;
  static const Color red = Color(0xFFE50914);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: background,
              expandedHeight: 340,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      movie.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: darkGray,
                        alignment: Alignment.center,
                        child: Text(
                          'Image not available',
                          style: TextStyle(color: lightGray),
                        ),
                      ),
                    ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black87],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(
                movie.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieInfoSection(
                      duration: movie.duration,
                      ageRating: movie.ageRating,
                      releaseYear: movie.releaseYear,
                      genres: movie.genres,
                    ),
                    const SizedBox(height: 16),
                    ActionButtonsSection(),
                    const SizedBox(height: 24),
                    Text(
                      movie.description,
                      style: TextStyle(
                        color: lightGray,
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 32),
                    CastSection(cast: movie.cast),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieInfoSection extends StatelessWidget {
  final String duration;
  final String ageRating;
  final String releaseYear;
  final String genres;

  const MovieInfoSection({
    Key? key,
    required this.duration,
    required this.ageRating,
    required this.releaseYear,
    required this.genres,
  }) : super(key: key);

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Color(0xFF212121),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFFB3B3B3),
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        _buildBadge(duration),
        _buildBadge(ageRating),
        _buildBadge(releaseYear),
        _buildBadge(genres),
      ],
    );
  }
}

class ActionButtonsSection extends StatelessWidget {
  static const Color white = Colors.white;
  static const Color background = Color(0xFF141414);

  const ActionButtonsSection({Key? key}) : super(key: key);

  Widget _buildPlayButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: white,
        onPrimary: background,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      icon: const Icon(Icons.play_arrow, size: 28),
      label: const Text(
        'Play',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 28, color: Color(0xFFB3B3B3)),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFFB3B3B3),
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildPlayButton(),
        const SizedBox(width: 24),
        _buildIconButton(Icons.add, 'My List', () {}),
        _buildIconButton(Icons.thumb_up_outlined, 'Rate', () {}),
        _buildIconButton(Icons.share_outlined, 'Share', () {}),
      ],
    );
  }
}

class CastSection extends StatelessWidget {
  final List<String> cast;

  const CastSection({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cast.isEmpty) {
      return SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cast',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final actor = cast[index];
              return CastCard(name: actor);
            },
          ),
        ),
      ],
    );
  }
}

class CastCard extends StatelessWidget {
  final String name;

  const CastCard({Key? key, required this.name}) : super(key: key);

  static const double cardWidth = 100;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      child: Column(
        children: [
          Container(
            width: cardWidth,
            height: cardWidth,
            decoration: BoxDecoration(
              color: Color(0xFF212121),
              borderRadius: BorderRadius.circular(cardWidth / 2),
            ),
            child: Center(
              child: Text(
                name.isNotEmpty ? name[0] : '?',
                style: const TextStyle(
                  fontSize: 40,
                  color: Color(0xFFB3B3B3),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFB3B3B3),
            ),
          ),
        ],
      ),
    );
  }
}
class SwipePoster extends StatefulWidget {
  final List<Movie> movies;
  final Function(int) onPageChanged;

  const SwipePoster({Key? key, required this.movies, required this.onPageChanged}) : super(key: key);

  @override
  _SwipePosterState createState() => _SwipePosterState();
}

class _SwipePosterState extends State<SwipePoster> {
  PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      widget.onPageChanged(_pageController.page!.round());
    });
  }
@override
Widget build(BuildContext context) {
  return SizedBox(
    height: 400,
    child: PageView.builder(
      controller: _pageController,
      itemCount: widget.movies.length > 3 ? 3 : widget.movies.length,
      itemBuilder: (context, index) {
        final movie = widget.movies[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Stack(
            children: [
              // Background poster
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(movie.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),

              
              Positioned(
                bottom: 16,
                left: 16,
                child: SizedBox(
                  height: 40,
                  width: 120,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 243, 243, 243),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    icon: Icon(Icons.play_arrow,size:30,),
                    label: Text(
                      "Play",
                      style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,letterSpacing:0.4,),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

}

