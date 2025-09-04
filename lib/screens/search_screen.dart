import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global/global_file.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: GlobalFile.appBarUI(
        context,
        scaffoldKey: _scaffoldKey,
      ),
      body: Center(

        child: Text('To Search Page',
          style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp
          ),)
      ),
    );
  }
}
