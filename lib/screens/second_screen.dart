import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_testportal/screens/third_screen.dart';
import 'package:suitmedia_testportal/utils/common_helper.dart';

class SecondScreen extends StatefulWidget {
  final String name;

  SecondScreen({required this.name});

  @override
  StateSecondScreen createState() => StateSecondScreen(name: name);
}

class StateSecondScreen extends State<SecondScreen> {
  String name;
  String selected_user = 'Selected User Name';

  StateSecondScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('Second Screen',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF04021D)))),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0.5),
              child: Container(
                color: Color(0xFFE2E3E4),
                height: 1,
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(IconlyLight.arrow_left_2))),
        body: loadEverything(context));
  }

  Container loadEverything(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20), //add gap
          loadLbl_welcome(), //add label welcome
          loadLbl_name(), //add label name

          Spacer(), //add gap

          loadLbl_user(), //add label user

          Spacer(), //add gap

          loadBtn_choose_user(), //add button choose a user
          SizedBox(height: 30) //add gap
        ],
      ),
    );
  }

  Row loadLbl_welcome() {
    return Row(children: [
      SizedBox(width: 20),
      Text('Welcome',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF04021D))))
    ]);
  }

  Row loadLbl_name() {
    return Row(
      children: [
        SizedBox(width: 20),
        Text(name,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF04021D))))
      ],
    );
  }

  Align loadLbl_user() {
    return Align(
      alignment: Alignment.center,
      child: Text(selected_user,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF04021D)))),
    );
  }

  Align loadBtn_choose_user() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: 310,
            height: 41,
            decoration: BoxDecoration(
                color: Color(0xFF2B637B),
                borderRadius: BorderRadius.circular(12)),
            child: TextButton(
                onPressed: () async {
                  String result =
                      await CommonHelper.moveScreen(context, ThirdScreen());

                  setState(() {
                    selected_user = result;
                  });
                },
                child: Text('Choose a User',
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 14, color: Colors.white))))));
  }
}
