import 'package:ecommerce_app/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingBagScreen extends StatefulWidget {
  const ShoppingBagScreen({super.key});

  @override
  State<ShoppingBagScreen> createState() => _ShoppingBagScreenState();
}

class _ShoppingBagScreenState extends State<ShoppingBagScreen> {
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
        title: Text("Shopping Bag", style: GoogleFonts.montserrat(fontSize: 17.sp, fontWeight: FontWeight.w600, color: Colors.black),),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                shape: BoxShape.circle
            ),
            child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.favorite_border, size: 20, color: Colors.black,)),
          ),
        ],
      ),
      body: buildOrderSummaryCard(),
      bottomNavigationBar: buildBottomBar(),

    );
  }

  Widget buildOrderSummaryCard(){
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.asset(
                  'assets/images/woman_kurta_img.jpg',
                  width: 123.w,
                  height: 140.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Women's Casual Wear",
                      style: GoogleFonts.montserrat(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black),),
                      SizedBox(height: 4.h),
                      Text("Checked Single Breasted Blazer",
                        style: GoogleFonts.montserrat(fontSize: 13.sp, fontWeight: FontWeight.w400, color: Colors.black),),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                            DropdownButton<String>(
                                value: "42",
                                items: ["42", "44"]
                                      .map((e) => DropdownMenuItem(child: Text("Size $e",  style: GoogleFonts.montserrat(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),),
                                value: e,)).toList(),
                                onChanged: (_){}),
                          SizedBox(width: 12.w),
                          DropdownButton<String>(
                            borderRadius: BorderRadius.circular(4.r),
                              focusColor: Colors.grey.shade300,
                              value: "1",
                              items: ["1", "2"]
                                  .map((e) => DropdownMenuItem(child: Text("Qty $e",  style: GoogleFonts.montserrat(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),),
                                value: e,)).toList(),
                              onChanged: (_){}),
                        ],
                      ),
                      SizedBox(height: 4.w),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "Delivery by  ",  style: GoogleFonts.montserrat(fontSize: 13.sp, fontWeight: FontWeight.w400, color: Colors.black),),
                        TextSpan(text: "10 May 2XXX",  style: GoogleFonts.montserrat(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black),)
                      ]))
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 32.h),
          Row(
            children: [
              Icon(Icons.discount, color: Colors.black, size: 16,),
              SizedBox(width: 8.w),
              Expanded(
                child: Text("Apply Coupons",  style: GoogleFonts.montserrat(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.black),),
              ),
              Text("Select",  style: GoogleFonts.montserrat(fontSize: 15.sp, fontWeight: FontWeight.w600, color: Colors.redAccent.shade200),)
            ],
          ),
          Divider(height: 40.h),
          
          Text("Order Payment Details",  style: GoogleFonts.montserrat(fontSize: 17.sp, fontWeight: FontWeight.w500, color: Colors.black),),
          SizedBox(height: 12.h),
          rowItem("Order Amounts", "₹ 7,000.00"),
          rowItem("Convenience", "Apply Coupon",
              subLabel: "Know More", labelColor: Colors.redAccent.shade200),
          rowItem("Delivery Fee", "Free", labelColor: Colors.redAccent.shade200),
          Divider(height: 32.h),
          rowItem("Order Total", "₹ 7,000.00", isBold: true),
          SizedBox(height: 4.h),
          rowItem("EMI Available", "Details", labelColor: Colors.redAccent.shade200)
        ],
      ),
    );
  }

  Widget rowItem(String label, String value, {String? subLabel, Color? labelColor, bool isBold = false}){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
          style: GoogleFonts.montserrat(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.black),
              ),
          if(subLabel != null)
            Text(subLabel,
              style: GoogleFonts.montserrat(fontSize: 12.sp, fontWeight: FontWeight.w600, color: Colors.redAccent.shade200),),
          Text(value,
              style: GoogleFonts.montserrat(
                  fontSize: 12.sp,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
                  color: labelColor ?? Colors.black)),
        ],
      ),
    );
  }

  Widget buildBottomBar() {
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10.r,
            offset: Offset(0, -2),
          ),
        ],
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        border: Border.all(color: Colors.grey.shade300)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("₹ 7,000.00",
                  style: GoogleFonts.montserrat(
                      fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black)),
              Text("View Details",
                  style: GoogleFonts.montserrat(
                      fontSize: 12.sp, color: Colors.redAccent.shade200, fontWeight: FontWeight.w500)),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent.shade200,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
            },
            child: Text("Proceed to Payment",
                style: GoogleFonts.montserrat(
                    fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.white,)),
          ),
        ],
      ),
    );
  }

}
