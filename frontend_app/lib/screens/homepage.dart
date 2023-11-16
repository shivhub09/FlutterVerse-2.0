import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend_app/cards/Recipe_card.dart';
import 'package:frontend_app/models/recipe_model.dart';
import 'package:frontend_app/screens/recipe_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _controller = TextEditingController();
  late Future<List<Recipe>> _futureRecipes;
  late String textTitle;

  @override
  void initState() {
    super.initState();
    textTitle = 'Mexican';
    _futureRecipes = fetchRecipes(textTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 45, 20, 0),
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

          // searchbox widget created
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
                  onFieldSubmitted: (value) {
                    setState(() {
                      textTitle = value;
                      _futureRecipes = fetchRecipes(value);
                    });
                  },
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
          // ends here

          // this is for the listview of the recipe cards
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textTitle,
                    style: GoogleFonts.sanchez(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<Recipe>>(
                      future: _futureRecipes,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(child: Text('No recipes found'));
                        } else {
                          return ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: snapshot.data!.length,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RecipeScreen(
                                                imageUrl: snapshot
                                                    .data![index].imageUrl,
                                                title: snapshot
                                                    .data![index].displayName,
                                                instructions: snapshot
                                                    .data![index].instructions,
                                              )));
                                },
                                child: RecipeCard(
                                  imageUrl: snapshot.data![index].imageUrl,
                                  title: snapshot.data![index].displayName,
                                ),
                              );
                            }),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // this is the end where the list view of the card ends
        ],
      ),
    );
  }

  // function starts here
  Future<List<Recipe>> fetchRecipes(String query) async {
    var url = Uri.parse('https://tasty.p.rapidapi.com/recipes/list');

    var headers = {
      'X-RapidAPI-Key': '682d0337cemshd966d21fce23698p19ef72jsn6d730c813e9f',
      'X-RapidAPI-Host': 'tasty.p.rapidapi.com',
    };

    var params = {
      'from': '0',
      'size': '10', // Fetch 5 recipes
      'q': query,
    };

    var response =
        await http.get(url.replace(queryParameters: params), headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json['results'][0]["instructions"]);
      return List.generate(json['results'].length, (index) {
        return Recipe(
            displayName: json["results"][index]["name"],
            imageUrl: json["results"][index]["thumbnail_url"],
            description: json["results"][index]["description"],
            instructions: json["results"][index]["instructions"]);
      });
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  // function ends here
}
