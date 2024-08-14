import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_testportal/controllers/first_screen_controller.dart';
import 'package:suitmedia_testportal/screens/second_screen.dart';
import 'package:suitmedia_testportal/utils/common_helper.dart';

class FirstScreen extends StatefulWidget {
  @override
  StateFirstScreen createState() => StateFirstScreen();
}

class StateFirstScreen extends State<FirstScreen> {
  FirstScreenController _controller = FirstScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: loadEverything(context));
  }

  BoxDecoration _loadBackground() {
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/background.png'), fit: BoxFit.cover));
  }

  Container loadEverything(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: _loadBackground(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loadBtn_add_photo(), //button add photo
            SizedBox(height: 40), //add gap
            loadFld_name(), //field name
            SizedBox(height: 20), //add gap
            loadFld_palindrome(), //field palindrome
            SizedBox(height: 40), //add gap
            loadBtn_check(), //button check
            SizedBox(height: 20), //add gap
            loadBtn_next() //buton next
          ],
        ));
  }

  Container loadBtn_add_photo() {
    return Container(
        width: 116,
        height: 116,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/btn_add_photo.png'),
                fit: BoxFit.cover)),
        child: TextButton(onPressed: () {}, child: Text('')));
  }

  Container loadFld_name() {
    return Container(
        width: 310,
        height: 39.88,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF686777))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Color(0xFFE2E3E4), width: 0.5))),
            onChanged: (value) {
              if (!value.isEmpty) {
                _controller.name = value;
              }
            }));
  }

  Container loadFld_palindrome() {
    return Container(
        width: 310,
        height: 39.88,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Palindrome',
                hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF686777))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Color(0xFFE2E3E4), width: 0.5))),
            onChanged: (value) {
              if (!value.isEmpty) {
                _controller.palindrome = value;
              }
            }));
  }

  Container loadBtn_check() {
    return Container(
        width: 310,
        height: 41,
        decoration: BoxDecoration(
            color: Color(0xFF2B637B), borderRadius: BorderRadius.circular(12)),
        child: TextButton(
            onPressed: () {
              if (_controller.palindrome.isEmpty) {
                CommonHelper.showMessage(
                    context, 'kolom palindrome harus diisi');
              } else {
                if (_controller.isPalindrome()) {
                  CommonHelper.showMessage(context, 'isPalindrome');
                } else {
                  CommonHelper.showMessage(context, 'not palindrome');
                }
              }
            },
            child: Text('CHECK',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 14, color: Colors.white)))));
  }

  Container loadBtn_next() {
    return Container(
        width: 310,
        height: 41,
        decoration: BoxDecoration(
            color: Color(0xFF2B637B), borderRadius: BorderRadius.circular(12)),
        child: TextButton(
            onPressed: () {
              if (_controller.name.isEmpty) {
                CommonHelper.showMessage(context, 'kolom nama harus diisi');
              } else {
                CommonHelper.moveScreen(
                    context, SecondScreen(name: _controller.name));
              }
            },
            child: Text('NEXT',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 14, color: Colors.white)))));
  }
}
