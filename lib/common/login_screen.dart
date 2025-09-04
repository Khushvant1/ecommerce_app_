import 'package:ecommerce_app/common/forget_password_screen.dart';
import 'package:ecommerce_app/common/get_started_screen.dart';
import 'package:ecommerce_app/common/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global/global_file.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome\nBack!",
                style: GoogleFonts.montserrat(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                )),
                SizedBox(height: 43.h),
                GlobalFile.editText("Username or email", userNameController, Icons.person, false),

                   SizedBox(height: 20.h),
                    TextFormField(
                      obscureText: hidePassword,
                      controller: passwordController,
                      style: GoogleFonts.montserrat(fontSize: 14.0.sp, color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                          filled: true,
                          fillColor: Color(0xFFF3F3F3),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined
                          ),
                          onPressed: (){
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0.r)
                        )
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
                          },
                          child: Text(
                            "Forget Password?",
                            style: GoogleFonts.montserrat(fontSize: 12.0.sp, color: Colors.redAccent, fontWeight: FontWeight.w400),
                          ),
                        )
                      ]
                    ),
                SizedBox(height: 30.h),
                GlobalFile.roundedButton(
                      (){
                    Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => GetStartedScreen()));
                  },
                  Text("Login",
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp, color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),)
                ),

                SizedBox(height: 30.h),
                Center(
                  child: Text("- OR Continue with -", style: GoogleFonts.montserrat(fontSize: 12.sp,color: Colors.grey.shade600),),
                ),
                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: GlobalFile.socialIcon('assets/images/google_logo.png', )),
                    SizedBox(width: 10),
                    Flexible(child: GlobalFile.socialIcon('assets/images/apple_logo.png')),
                    SizedBox(width: 10),
                    Flexible(child: GlobalFile.socialIcon('assets/images/facebook.png')),
                  ],
                ),
                SizedBox(height: 30.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Create An Account", style: GoogleFonts.montserrat(color: Colors.grey.shade600),),
                    TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignupScreen()));
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.montserrat(color: Colors.redAccent, decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
      )
    );
  }
}
