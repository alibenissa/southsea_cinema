import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 0;

  String _bookingMessage = '';

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
                Text('169 mins',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
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
                // 4. The DropdownMenu replacing the placeholder text
                DropdownMenu<int>(
                  initialSelection: 0,
                  label: const Text('Tickets'),
                  onSelected: (int? value) {
                    if (value != null) {
                      setState(() {
                        _ticketQuantity = value; // Update the state
                      });
                    }
                  },
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 0, label: '0'),
                    DropdownMenuEntry(value: 1, label: '1'),
                    DropdownMenuEntry(value: 2, label: '2'),
                    DropdownMenuEntry(value: 3, label: '3'),
                    DropdownMenuEntry(value: 4, label: '4'),
                    DropdownMenuEntry(value: 5, label: '5'),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _bookingMessage =
                          'Added $_ticketQuantity ticket(s) to your order!';
                    });
                  },
                  child: const Text('Add to order'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              _bookingMessage,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
