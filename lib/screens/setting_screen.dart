import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global/global_file.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
        child: Text('To Setting Page',
          style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp
          ),),
      ),
    );
  }
}
