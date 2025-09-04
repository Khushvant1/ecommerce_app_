import 'package:ecommerce_app/global/global_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController usernameOrEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool showPassword = true;
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
                Text(
                  "Create an\naccount",
                  style: GoogleFonts.montserrat(
                    fontSize: 36.sp, fontWeight: FontWeight.w600,color: Colors.black
                  ),
                ),
                SizedBox(height: 36.h),
                
                GlobalFile.editText(
                    "Username or email",
                    usernameOrEmailController,
                    Icons.person,
                    false
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  obscureText: hidePassword,
                  controller: passwordController,
                  style: GoogleFonts.montserrat(fontSize: 14.0.sp, color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Color(0xFFF3F3F3),
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
                SizedBox(height: 20.h),
                TextFormField(
                  obscureText: showPassword,
                  controller: confirmPasswordController,
                  style: GoogleFonts.montserrat(fontSize: 14.0.sp, color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "ConfirmPassword",
                      hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Color(0xFFF3F3F3),
                      suffixIcon: IconButton(
                        icon: Icon(
                            hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined
                        ),
                        onPressed: (){
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0.r)
                      )
                  ),
                ),
                SizedBox(height: 16.h),

                Text(
                  "By clicking the Register button, you agree\nto the public offer",
                  style: GoogleFonts.montserrat(
                      fontSize: 12.sp, fontWeight: FontWeight.w400, color: Colors.grey.shade600
                  ),
                ),

                SizedBox(height: 32.h),

                GlobalFile.roundedButton(
                    (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    Text(
                        "Create Account",
                        style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,
                            fontSize: 17.sp, color: Colors.white
                    )
                    ),
                ),
                SizedBox(height: 30.h),
                Center(
                  child: Text("- OR Continue with -", style: GoogleFonts.montserrat(fontSize: 12.sp, color: Colors.grey.shade600),),
                ),
                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: GlobalFile.socialIcon('assets/images/google_logo.png')),
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
                    Text("I Already Have An Account", style: GoogleFonts.montserrat(color: Colors.grey.shade600),),
                    TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.montserrat(color: Colors.redAccent, decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
