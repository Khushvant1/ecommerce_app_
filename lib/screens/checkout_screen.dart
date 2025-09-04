import 'package:ecommerce_app/dashboard_screen.dart';
import 'package:ecommerce_app/screens/shopping_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bottom_navigationbar.dart';
import '../common/forget_password_screen.dart';
import '../global/global_file.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: Icon(Icons.arrow_back_ios_new_rounded, size: 16, color: Colors.black)),
          ),
          title: Text("Checkout", style: GoogleFonts.montserrat(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),),
          centerTitle: true,
        ),
      body: SingleChildScrollView(
         child: Padding(
             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage: AssetImage('assets/images/circle_img.png'),
                    ),
                    CircleAvatar(
                      radius: 12.r,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.edit, size: 16.sp, color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text('Personal Details', style: GoogleFonts.montserrat(fontSize: 16.sp, fontWeight: FontWeight.w600,color: Colors.black)),
              ),
              SizedBox(height: 16.h),
              _buildTextField(label: 'Email Address', hint: 'aashifa@gmail.com'),
              SizedBox(height: 16.h),
              _buildTextField(label: 'Password', hint: '********', obscureText: true,),
              SizedBox(height: 12.h),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
                      },
                      child: Text(
                        "Change Password",
                        style: GoogleFonts.montserrat(fontSize: 12.0.sp, color: Colors.redAccent, fontWeight: FontWeight.w500, decoration: TextDecoration.underline),
                      ),
                    )
                  ]
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text('Business Adress Details', style: GoogleFonts.montserrat(fontSize: 16.sp, fontWeight: FontWeight.w600,color: Colors.black)),
              ),
              SizedBox(height: 16.h),
              _buildTextField(label: 'Pincode', hint: '450116'),
              SizedBox(height: 16.h),
              _buildTextField(label: 'Address', hint: "216 St Paul's Rd,"),
              SizedBox(height: 16.h),
              _buildTextField(label: 'City', hint: 'London'),
              SizedBox(height: 16.h),
              _buildDropdownField(label: 'State', value: 'N1 2LL'),
              SizedBox(height: 16.h),
              _buildTextField(label: 'Country', hint: 'United Kingdom'),

              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text('Bank Account Details', style: GoogleFonts.montserrat(fontSize: 16.sp, fontWeight: FontWeight.w600,color: Colors.black)),
              ),
              SizedBox(height: 16.h),
              _buildTextField(label: 'Bank Account Number', hint: '204356XXXXXXX'),
              SizedBox(height: 16.h),
              _buildTextField(label: "Account Holder's Name", hint: 'Abhiraj Sisodiya'),
              SizedBox(height: 16.h),
              _buildTextField(label: 'IFSC Code', hint: 'SBIN00428'),

              SizedBox(height: 30.h),
              GlobalFile.saveButton(
                      (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ShoppingListScreen()));
                  },
                  Text("Save",
                    style: GoogleFonts.montserrat(
                        fontSize: 16.sp, color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),)
              ),

              SizedBox(height: 50.h),
            ],
          ),
         ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    String? hint,
    bool obscureText = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: GoogleFonts.montserrat(fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w400)),
          SizedBox(height: 12.h),
          TextField(
            obscureText: obscureText,
            style: GoogleFonts.montserrat(fontSize: 13.0.sp, color: Colors.black),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 13.sp
              ),
              // suffixIcon: suffix,
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: GoogleFonts.montserrat(fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w400)),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: DropdownButton<String>(
              value: value,
              underline: const SizedBox(),
              isExpanded: true,
              items: [DropdownMenuItem(value: value, child: Text(value, style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 13.sp),))],
              onChanged: (val) {},
            ),
          )
        ],
      ),
    );
  }

}
