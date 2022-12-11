import 'package:capstone/Widget/Navbottombar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  MaterialColor themecolor = MaterialColor(
    const Color.fromARGB(255, 255, 91, 31).value,
    const <int, Color>{
      50: Color.fromRGBO(255, 91, 31, 0.1),
      100: Color.fromRGBO(255, 91, 31, 0.2),
      200: Color.fromRGBO(255, 91, 31, 0.3),
      300: Color.fromRGBO(255, 91, 31, 0.4),
      400: Color.fromRGBO(255, 91, 31, 0.5),
      500: Color.fromRGBO(255, 91, 31, 0.6),
      600: Color.fromRGBO(255, 91, 31, 0.7),
      700: Color.fromRGBO(255, 91, 31, 0.8),
      800: Color.fromRGBO(255, 91, 31, 0.9),
      900: Color.fromRGBO(255, 91, 31, 1),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
        primarySwatch: themecolor,
      ),
      home: const BottomNavBar(),
    );
  }
}
