import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iconly/iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_testportal/providers/third_screen_provider.dart';

class ThirdScreen extends StatefulWidget {
  @override
  StateThirdScreen createState() => StateThirdScreen();
}

class StateThirdScreen extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Third Screen',
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
                Navigator.pop(context, 'Selected User Name');
              },
              icon: Icon(IconlyLight.arrow_left_2))),
      body: Consumer<ThirdScreenProvider>(builder: (context, provider, child) {
        return loadEverything(context, provider);
      }),
    );
  }

  Widget loadEverything(BuildContext context, ThirdScreenProvider provider) {
    return Center(
      child: Container(
          width: 335,
          height: 640,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: provider.isLoading
              ? Center(child: CircularProgressIndicator())
              : loadList_users(provider)),
    );
  }

  Widget loadList_users(ThirdScreenProvider provider) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: provider.refreshUsers,
            child: ListView.builder(
              itemCount: provider.users.length,
              itemBuilder: (context, index) {
                final user = provider.users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                  onTap: () {
                    String result = '${user.firstName} ${user.lastName}';
                    Navigator.pop(context, result);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
