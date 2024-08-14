import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_testportal/providers/third_screen_provider.dart';
import 'package:suitmedia_testportal/screens/first_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThirdScreenProvider())
        ],
        child: MaterialApp(
          home: Scaffold(body: FirstScreen()),
          theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        ));
  }
}
