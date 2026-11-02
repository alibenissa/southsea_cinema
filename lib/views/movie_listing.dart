import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart'; // Import your Movie model

class MovieListing extends StatefulWidget {
  final Movie movie; 

  const MovieListing({super.key, required this.movie});

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
            Text(
              widget.movie.title,
              style: cinemaHeaderStyle,
            ),
            const SizedBox(height: 8),
            // Dynamic Age Rating and Screening Time
            Row(
              children: [
                Text(widget.movie.ageRating,
                    style: const TextStyle(fontSize: 14, color: cinemaFontMuted)),
                const SizedBox(width: 8),
                const Text('|',
                    style: TextStyle(fontSize: 14, color: cinemaFontMuted)),
                const SizedBox(width: 8),
                Text(widget.movie.screeningTime,
                    style: const TextStyle(fontSize: 14, color: cinemaFontMuted)),
              ],
            ),
            const SizedBox(height: 16),
            // Dynamic Synopsis
            Text(
              widget.movie.synopsis,
              style: const TextStyle(fontSize: 16, color: cinemaFontWhite),
            ),
            const Spacer(),
            LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownMenu<int>(
                      initialSelection: 0,
                      label: Text(
                        'Tickets (£${widget.movie.ticketPrice.toStringAsFixed(2)} each)',
                        style: const TextStyle(color: cinemaFontWhite),
                      ),
                      textStyle: const TextStyle(color: cinemaFontWhite),
                      onSelected: (int? value) {
                        if (value != null) {
                          setState(() {
                            _ticketQuantity = value;
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
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cinemaBrand,
                        foregroundColor: cinemaFontWhite,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _bookingMessage =
                              'Added $_ticketQuantity ticket(s) to your order for ${widget.movie.title}!';
                        });
                      },
                      child: const Text('Add to order'),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              _bookingMessage,
              style: const TextStyle(
                fontSize: 16,
                color: cinemaBrand,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}