import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({super.key, required this.movie});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 0;
  String _bookingMessage = '';
  void _addToBasket() {
    if (_ticketQuantity > 0) {
      final TicketItem item = TicketItem(
        movie: widget.movie,
        quantity: _ticketQuantity,
      );
      BasketRepository.instance.addItem(item);
      setState(() {
        _bookingMessage =
            'Added $_ticketQuantity ticket(s) to your order for ${widget.movie.title}!';
      });
    } else {
      setState(() {
        _bookingMessage = 'Please select at least 1 ticket';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        child: Card(
          color: cinemaSurface,
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.movie.title,
                  style: cinemaHeaderStyle,
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    Text(
                      widget.movie.ageRating,
                      style:
                          const TextStyle(fontSize: 14, color: cinemaFontMuted),
                    ),
                    const SizedBox(width: 8),
                    const Text('|',
                        style: TextStyle(fontSize: 14, color: cinemaFontMuted)),
                    const SizedBox(width: 8),
                    Text(
                      widget.movie.screeningTime,
                      style:
                          const TextStyle(fontSize: 14, color: cinemaFontMuted),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Image.asset(
                  widget.movie.posterImagePath,
                  width: 80,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),

                Text(
                  widget.movie.synopsis,
                  style: const TextStyle(fontSize: 16, color: cinemaFontWhite),
                ),
                const SizedBox(height: 24),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownMenu<int>(
                          initialSelection: 0,
                          label: Text(
                            'Tickets (${widget.movie.formattedPrice} each)',
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
                        PrimaryButton(
                          label: 'Add to order',
                          onPressed: _addToBasket,
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
        ),
      ),
    );
  }
}
