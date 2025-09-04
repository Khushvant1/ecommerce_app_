import 'package:ecommerce_app/dashboard_screen.dart';
import 'package:ecommerce_app/global/global_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bottom_navigationbar.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/getstarted_img.jpeg',
          fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.5),
                  ])
            ),
          ),

          // content
          SafeArea(
              child: Column(
                children: [
                  const Spacer(flex: 5,),

                  //Text content show
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      Text('You want\nAuthentic, here\nyou go!',
                      style: GoogleFonts.montserrat(
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.2.h,
                      ),
                      textAlign: TextAlign.center,),
                      SizedBox(height: 12.h),
                      Text('Find it here, buy it now!',
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center
                      ),
                    ],
                  ),
                  ),

                  const Spacer(flex: 1),

                  // add button
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
                      child: GlobalFile.roundedButton(
                          (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyNavigationBar()));
                          },
                        Text('Get Started',
                        style: GoogleFonts.montserrat(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),)
                      ),
                  )
                ],
              ))
        ],
      )
    );
  }
}
