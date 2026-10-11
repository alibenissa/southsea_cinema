import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interstellar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              '2h | 49 mins',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 12),
            Text(
              'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
