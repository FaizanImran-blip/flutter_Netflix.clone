import 'package:flutter/material.dart';

void main() {
  runApp(NetflixMovieDetailApp());
}

class NetflixMovieDetailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Movie Detail',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Dark theme inspired by Netflix
        brightness: Brightness.dark,
        primaryColor: NetflixColors.red,
        scaffoldBackgroundColor: NetflixColors.background,
        fontFamily: 'Montserrat',
      ),
      home: MovieDetailScreen(),
    );
  }
}

// Color palette inspired by Netflix style
class NetflixColors {
  static const Color background = Color(0xFF141414);
  static const Color red = Color(0xFFE50914);
  static const Color darkGray = Color(0xFF212121);
  static const Color lightGray = Color(0xFFB3B3B3);
  static const Color white = Colors.white;
}

// Main screen for movie details
class MovieDetailScreen extends StatelessWidget {
  // Sample static data - replace with dynamic data as needed
  final String movieTitle = 'The Witcher: Nightmare of the Wolf';
  final String description =
      'A prequel, which follows the origin story of Vesemir, Geralt\'s mentor.';
  final String duration = '1h 20m';
  final String ageRating = '16+';
  final String releaseYear = '2021';
  final String genres = 'Action, Fantasy, Anime';
  final String bannerImageUrl =
      'https://placehold.co/600x340/6366f1/ffffff?text=Netflix+Movie+Banner';
  final List<String> cast = [
    'Theo James',
    'Lara Pulver',
    'Mary McDonnell',
    'Graham McTavish'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Whole screen scrollable
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: NetflixColors.background,
            expandedHeight: 340,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    bannerImageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: NetflixColors.darkGray,
                      alignment: Alignment.center,
                      child: Text(
                        'Image not available',
                        style: TextStyle(color: NetflixColors.lightGray),
                      ),
                    ),
                  ),
                  // Gradient overlay bottom-to-top for text readability
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
              movieTitle,
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
                    duration: duration,
                    ageRating: ageRating,
                    releaseYear: releaseYear,
                    genres: genres,
                  ),
                  const SizedBox(height: 16),
                  ActionButtonsSection(),
                  const SizedBox(height: 24),
                  Text(
                    description,
                    style: TextStyle(
                      color: NetflixColors.lightGray,
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 32),
                  CastSection(cast: cast),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Section with movie info badges (duration, age rating, year, genres)
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
        color: NetflixColors.darkGray,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: NetflixColors.lightGray,
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

// Section with action buttons like Play, My List, Share etc.
class ActionButtonsSection extends StatelessWidget {
  const ActionButtonsSection({Key? key}) : super(key: key);

  Widget _buildPlayButton() {
    return ElevatedButton.icon(
      onPressed: () {
        // play action here
      },
      style: ElevatedButton.styleFrom(
        primary: NetflixColors.white,
        onPrimary: NetflixColors.background,
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
            Icon(icon, size: 28, color: NetflixColors.lightGray),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: NetflixColors.lightGray,
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

// Section for cast list with horizontal scroll
class CastSection extends StatelessWidget {
  final List<String> cast;

  const CastSection({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cast',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: NetflixColors.white,
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

// Individual actor card with placeholder avatar
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
              color: NetflixColors.darkGray,
              borderRadius: BorderRadius.circular(cardWidth / 2),
            ),
            child: Center(
              child: Text(
                name.isNotEmpty ? name[0] : '?',
                style: const TextStyle(
                  fontSize: 40,
                  color: NetflixColors.lightGray,
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
              color: NetflixColors.lightGray,
            ),
          ),
        ],
      ),
    );
  }
}
