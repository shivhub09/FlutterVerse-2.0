import 'package:flutter/material.dart';
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
      backgroundColor: Colors.black,
      body: Stack(
        children: [

          // top heading 
          Positioned(
            top: 45,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "What's in your mind? ",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.red,
                )
              ],
            ),
          ),


          // search box
          

          // Recipe Cards

        ],
      ),
    );
  }
}
