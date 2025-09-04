import 'package:ecommerce_app/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalFile {
  static editText(
      String hint, TextEditingController controller, IconData prefixIcon, bool toHide) {
    return TextFormField(
      controller: controller,
      obscureText: toHide,
      style: GoogleFonts.montserrat(fontSize: 14.0.sp, color: Colors.black),
      decoration: InputDecoration(
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(width: 0.5),
          //   borderRadius: BorderRadius.circular(10.0),
          // ),
          border: OutlineInputBorder(
              // borderSide: BorderSide(width: 0.5),
              borderRadius: BorderRadius.circular(10.0.r)),
          // enabledBorder: OutlineInputBorder(
          //     borderSide: BorderSide(width: 0.5),
          //     borderRadius: BorderRadius.circular(10.0)),
          hintText: hint,
          filled: true,
          fillColor: Color(0xFFF3F3F3),
          hintStyle: GoogleFonts.montserrat(color: Colors.grey),
          prefixIcon: Icon(prefixIcon),
      )
    );
  }

  static roundedButton(VoidCallback onPressed, Widget buttonText){
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFF83758),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            )
          ),
          child: buttonText,
      ),
    );
  }

  static socialIcon(String assetPath){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.redAccent),
        // borderRadius: BorderRadius.circular(4.r),
        shape: BoxShape.circle,
          color: Colors.grey.shade200
      ),
      child: Image.asset(
        assetPath,
        height: 24,
        width: 24,
        fit: BoxFit.contain,

      ),
    );
  }

  static appBarUI(BuildContext context, {GlobalKey<ScaffoldState>? scaffoldKey,VoidCallback? onMenuPressed}){
    return AppBar(
      // backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Container(
          height: 32.h,
          width: 32.w,
          decoration: BoxDecoration(
            // color: Color(0xFFF5F5F5),
            shape: BoxShape.circle
          ),
          child: IconButton(
              icon: Image.asset('assets/images/drawer_icon.png',height: 20.h, width: 20.h, color: Colors.black),
              onPressed: onMenuPressed ?? (){
                if(scaffoldKey != null){
                  scaffoldKey.currentState?.openDrawer();
                }
              }
              ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png',
          height: 31.08.h,
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen()));
            },
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/circle_img.png',),
            ),
          ),
        )
      ],
    );
  }

  static saveButton(VoidCallback onPressed, Widget buttonText){
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              )
          ),
          child: buttonText,
        ),
      ),
    );
  }

  static sizeBox(String text, bool isSelected, VoidCallback onTap){
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(right: 8.w),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.redAccent.shade100 : Colors.white,
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: Colors.redAccent.shade100)
          ),
          child: Text(text, style: GoogleFonts.montserrat(fontSize: 13.sp, fontWeight: FontWeight.w600, color: isSelected ? Colors.white : Colors.redAccent.shade100),textAlign: TextAlign.center,),
        ),
      );
  }

  static iconBox(IconData icon, String text,){
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: Colors.grey.shade400)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16.sp, color: Colors.grey.shade500,),
          Text(text, style: GoogleFonts.montserrat(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.grey.shade500), textAlign: TextAlign.center),
        ],
      ),

    );
  }

//   static gradientButton({
//     required IconData icon,
//     required String text,
//     required List<Color> gradientColors,
//     required VoidCallback onTap,
// }){
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: EdgeInsets.only(right: 12.w),
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(colors: gradientColors),
//           borderRadius: BorderRadius.circular(4   .r),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               padding: EdgeInsets.all(8.w),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white.withOpacity(0.2),
//                 gradient: LinearGradient(colors: gradientColors),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 2,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Icon(icon, size: 16.sp, color: Colors.white),
//             ),
//               SizedBox(width: 8.w),
//               Text(
//                 text,
//                 style: GoogleFonts.montserrat(
//                   fontSize: 16.sp,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w500,
//                 )
//               )
//           ],
//         ),
//       ),
//     );
//   }
  static Widget gradientButtonWithIcon({
    required IconData icon,
    required String text,
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main button
          Container(
            margin: EdgeInsets.only(left: 24.w), // space for icon
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: gradientColors),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 13.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Circular icon positioned left
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 52.w,
              height: 54.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: gradientColors),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4.r,
                  )
                ],
              ),
              child: Center(
                child: Icon(icon, size: 21.sp, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static iconWithContainer({
     required String text,
    required IconData icon
    }){
    return Container(
      margin: EdgeInsets.only(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade400)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18.sp, color: Colors.black,),
          Text(text, style: GoogleFonts.montserrat(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  static Widget paymentCard({
    required String iconPath,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
    double iconHeight = 30,
    double iconWidth = 40,
  }){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? Colors.redAccent : Colors.grey.shade300,
            width: isSelected ? 2 : 1
          )
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              height: iconHeight.h,
              width: iconWidth.w,
              // fit: BoxFit.contain,
            ),
            Spacer(),
            Text(text,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              color: Colors.grey.shade400
            ),)
          ],
        ),
      ),
    );
  }

}