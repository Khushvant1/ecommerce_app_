import 'package:ecommerce_app/common/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global/global_file.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Forgot\npassword?",
                style: GoogleFonts.montserrat(fontSize: 36.sp, color: Colors.black, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 43.h,),
                
                GlobalFile.editText(
                    "Enter your email address",
                    emailController,
                    Icons.email,
                    false
                ),

                SizedBox(height: 32.h),
                
                Text("* We will send you a message to set or reset\n your new password",
                style: GoogleFonts.montserrat(fontSize: 12.sp, fontWeight: FontWeight.w400, color: Colors.grey.shade600),
                ),

                SizedBox(height: 36.h),
                GlobalFile.roundedButton(
                    () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                Text(
                  "Submit",
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,
                  fontSize: 17.sp, color: Colors.white),
                )
                )
              ],
            ),
          )),
    );
  }
}
