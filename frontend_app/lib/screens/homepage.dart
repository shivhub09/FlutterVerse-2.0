import 'package:flutter/material.dart';
import 'package:frontend_app/cards/Recipe_card.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // to arrange the widgets in a vertical fashion
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 45, 20, 0),
            // Row widget to make all the widgets inside of it to be arranged in the horizontal fashion
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hello, Shivam!",
                  style: GoogleFonts.sanchez(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          // The Search Box
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.red),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: _controller,
                  style: GoogleFonts.montserrat(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    border: InputBorder.none,
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // The list of recipes
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(top: 20, left: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400.withOpacity(0.6),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                // arranging the text and the list of recipes in the column
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // the text
                  Text(
                    "Favorites : ",
                    style: GoogleFonts.sanchez(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // the expanded widget to arrange everything in the column
                  Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: 5,
                        itemBuilder: ((context, index) {
                          // this will return that many number of recipecard widgets equal to the itemcount
                          return const RecipeCard(
                            imageUrl:
                                "https://lh3.googleusercontent.com/x5MLeEHoOrjJdgAU2QBVL9wZpzXAfVAAMphZkTg9Pu5sLFftWEOAWWtlrcXgK_r3lkBg_WO8O5pZEcFUTc6aruXWbdrK-i72zQ",
                            title: "Seared Scallops Scampi with Spinach",
                            totalTime: "35 min",
                          );
                        })),
                  ),
                  // the expanded widgets ends here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
