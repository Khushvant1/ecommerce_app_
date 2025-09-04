import 'package:ecommerce_app/Models/shopping_model.dart';
import 'package:ecommerce_app/screens/shopping_bag_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final List<ShoppingModel> products = [
    ShoppingModel(
      title: "Women's Casual Wear",
      variations: ['Black', 'Red'],
      rating: 4.8,
      price: 34.00,
      originalPrice: 64.00,
      discountPercent: 33,
      imageUrl: 'assets/images/woman_kurta_img.jpg',
    ),
    ShoppingModel(
      title: "Men's Jacket",
      variations: ['Green', 'Grey'],
      rating: 4.7,
      price: 45.00,
      originalPrice: 67.00,
      discountPercent: 28,
      imageUrl: 'assets/images/watch_img.jpg',
    ),
  ];
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
        title: Text("Checkout", style: GoogleFonts.montserrat(fontSize: 17.sp, fontWeight: FontWeight.w600, color: Colors.black),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 16.sp, color: Colors.black,),
                  SizedBox(width: 4.w),
                  Text('Delivery Address',style: GoogleFonts.montserrat(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.black),)
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      // margin: EdgeInsets.only(left: 16.w),
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.r),
                        boxShadow: [BoxShadow(
                          blurRadius: 14.r,
                          color: Colors.black12
                        )]
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2.w,right: 4.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4.h),
                                Text("Address :", style: GoogleFonts.montserrat(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black)),
                                SizedBox(height: 8.h),
                                Text("216 St Paul's Rd, London N1 2LL, UK", style: GoogleFonts.montserrat(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black)),
                                Text("Contact : +44-784232", style: GoogleFonts.montserrat(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black)),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Image.asset('assets/images/edit_icon.png', height: 16.h, width: 16.w,),
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 12.w),
                  Container(
                    height: 78.h,
                    width: 79.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.r),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 14.r,
                          color: Colors.black12
                        )
                      ]
                    ),
                    child: Center(
                      child: Image.asset('assets/images/plus_icon.png', height: 24.h, width: 24.w,),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),
              Text("Shopping List", style: GoogleFonts.montserrat(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.black),),
              SizedBox(height: 8.h),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (_, index) => buildShoppingCard(products[index]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShoppingCard(ShoppingModel products) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingBagScreen()));
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.h,),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 6.r,
                offset: Offset(0, 2),
              )
            ],
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
                      products.imageUrl,
                      width: 130.53.w,
                      height: 120.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products.title,
                          style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(height: 8.h),
                        //  Variations
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Variations :",
                                style: GoogleFonts.montserrat(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                            SizedBox(width: 4.w),
                            ...products.variations.take(2).map((v) => Container(
                              margin: EdgeInsets.only(right: 4.w),
                              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black87),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                              child: Text(
                                v,
                                style: GoogleFonts.montserrat(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            )),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        //  Rating
                        Row(
                          children: [
                            Text("${products.rating}",
                                style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                            SizedBox(width: 4.w),
                            ...List.generate(
                              5,
                                  (index) => Icon(
                                Icons.star,
                                color: index < products.rating.floor()
                                    ? Colors.amber
                                    : Colors.grey.shade300,
                                size: 12.sp,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 8.h),

                        // 🟥 Price + Discount
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.r),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Text(
                                "\$ ${products.price}0",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "upto ${products.discountPercent}% off",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                ),
                                Text(
                                  "\$ ${products.originalPrice}0",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Divider(color: Colors.grey.shade300),
              SizedBox(height: 4.h),

              //  Total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Order (1)  :",
                    style: GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Text("\$ ${products.price.toStringAsFixed(2)}",
                      style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              )
            ],
          ),
      ),
    );
  }


}
