import 'package:ecommerce_app/global/global_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded, size: 16, color: Colors.black)),
        ),
        title: Text("Checkout", style: GoogleFonts.montserrat(fontSize: 17.sp, fontWeight: FontWeight.w600, color: Colors.black),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rowItem("Order", "₹ 7,000"),
            rowItem("Shipping", "₹  30"),
            rowItem("Total", "₹ 7030", labelColor: Colors.black),
            Divider(height: 28.h),
            SizedBox(height: 12.h),
            Text("Payment",
              style: GoogleFonts.montserrat(fontSize: 17.sp, fontWeight: FontWeight.w500, color: Colors.black),
            ),
            SizedBox(height: 12.h,),
            GlobalFile.paymentCard(
                iconPath: "assets/images/visa_icon_img.png",
                text:  '********2109',
                isSelected: selectedIndex == 0,
                iconHeight: 20.h,
                iconWidth: 47.83.w,
                onTap: (){
                  setState(() {
                    selectedIndex = 0;
                  });
                }
            ),
            SizedBox(height: 16.h,),
            GlobalFile.paymentCard(
                iconPath: "assets/images/paypal_img.png",
                text:  '********2109',
                isSelected: selectedIndex == 1,
                iconHeight: 20.h,
                iconWidth: 62.76.w,
                onTap: (){
                  setState(() {
                    selectedIndex = 1;
                  });
                }
            ),
            SizedBox(height: 16.h,),
            GlobalFile.paymentCard(
                iconPath: "assets/images/maestro_logo.png",
                text:  '********2109',
                isSelected: selectedIndex == 2,
                iconHeight: 20.h,
                iconWidth: 20.w,
                onTap: (){
                  setState(() {
                    selectedIndex = 2;
                  });
                }
            ),
            SizedBox(height: 16.h,),
            GlobalFile.paymentCard(
                iconPath: "assets/images/apple_logo_img.png",
                text:  '********2109',
                isSelected: selectedIndex == 3,
                iconHeight: 24.h,
                iconWidth: 24.w,
                onTap: (){
                  setState(() {
                    selectedIndex = 3;
                  });
                }
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(context: context,
                      // barrierDismissible: false,
                      builder: (context) => paymentSuccessDialog(context));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: GoogleFonts.montserrat(fontSize: 17.sp, fontWeight: FontWeight.w700, color: Colors.white),

                ),
              ),
            )
          ],
        ),
      ),

    );
  }
  Widget rowItem(String label, String value, {Color? labelColor}){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
            style: GoogleFonts.montserrat(fontSize: 17.sp, fontWeight: FontWeight.w500, color: Colors.grey.shade600),
          ),
          Text(value,
            style: GoogleFonts.montserrat(fontSize: 17.sp, fontWeight: FontWeight.w500, color: Colors.grey.shade600),
          ),

        ],
      ),
    );
  }
  Widget paymentSuccessDialog(BuildContext context){
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 36.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           Image.asset(""),
           SizedBox(height: 20.h,),
           Text(
             "Payment done successfully",
             style: GoogleFonts.montserrat(
               fontSize: 13.sp,
               fontWeight: FontWeight.w600,
               color: Colors.black
             ),
           )
          ]
        ),
      ),
    );
  }
}
