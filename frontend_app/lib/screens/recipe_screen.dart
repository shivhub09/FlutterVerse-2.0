import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final List<dynamic> instructions;

  RecipeScreen({
    required this.imageUrl,
    required this.title,
    required this.instructions,
  });

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.title,
              style: GoogleFonts.sanchez(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: widget.instructions.length,
              itemBuilder: (context, index) {
                var step = widget.instructions[index]["display_text"];
                return Card(
                  color: Colors.white,
                  elevation: 4, // Add elevation to the card
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        '${index + 1}',
                      ), // Display step number
                    ),
                    title: Text(
                      step,
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality for the floating action button if needed
        },
        child: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        // Customize the floating action button as needed
      ),
    );
  }
}
