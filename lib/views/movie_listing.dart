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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Interstellar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Text('12A', style: TextStyle(fontSize: 14, color: Colors.grey)),
                SizedBox(width: 8),
                Text('|', style: TextStyle(fontSize: 14, color: Colors.grey)),
                SizedBox(width: 8),
                Text('169 mins', style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Quantity Dropdown (Next Exercise)'),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Book Ticket'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
