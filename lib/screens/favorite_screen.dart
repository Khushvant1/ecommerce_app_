import 'package:ecommerce_app/Models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global/global_file.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  final List<DataModel> dummyProducts =[
    DataModel(
      imagePath: 'assets/images/woman_kurta_img.jpg',
      title: 'Women Printed Kurta',
      subtitle: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: '₹1500',
      reviews: '56890',
    ),
    DataModel(
      imagePath: 'assets/images/sneaker_shoes_img.jpg',
      title: 'HRX by Hrithik Roshan',
      subtitle: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: '₹2499',
      reviews: '344567',
    ),
    DataModel(
      imagePath: 'assets/images/woman_kurta_img.jpg',
      title: 'Women Printed Kurta',
      subtitle: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: '₹1500',
      reviews: '56890',
    ),
    DataModel(
      imagePath: 'assets/images/sneaker_shoes_img.jpg',
      title: 'HRX by Hrithik Roshan',
      subtitle: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: '₹2499',
      reviews: '344567',
    ),

  ];



  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: GlobalFile.appBarUI(
        context,
        scaffoldKey: _scaffoldKey,
      ),
      drawer: Drawer(),
      body: Container(
        padding: EdgeInsets.only(bottom: 52.h),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
                shadowColor: Colors.black.withOpacity(0.1),
                margin: EdgeInsets.zero,
                child: TextField(
                  controller: searchController,
                  style: GoogleFonts.montserrat(color: Colors.black, fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText: 'Search any product...',
                    hintStyle: GoogleFonts.montserrat(color: Colors.grey.shade400, fontSize: 14.sp, fontWeight: FontWeight.w400),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                    suffixIcon: Icon(Icons.mic_none, color: Colors.grey.shade400),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('52,082+ Iteams', style: GoogleFonts.montserrat(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            print('Sort button taped');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.r),
                                boxShadow: [BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 2.r,
                                    offset: Offset(0,1)
                                )
                                ]
                            ),
                            child: Row(
                              children: [
                                Text('Sort',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black
                                    )),
                                SizedBox(width: 4.w),
                                // Icon(Icons.arrow_upward, size: 16.sp,),
                                // Icon(Icons.arrow_downward, size: 16.sp,)
                                Image.asset(
                                  'assets/images/sort_icon.png',
                                  height: 14.h,
                                  width: 14.w,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        InkWell(
                          onTap: (){
                            print('Filter button tabed');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Text('Filter',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),),
                                // SizedBox(width: 4.w,)
                                Icon(Icons.filter_alt_outlined, size: 16.sp,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
            ),
            SizedBox(height: 12.h),
            gridProductList(dummyProducts),
            SizedBox(height: 50.h),
          ],
        ),
      ),

    );
  }

  gridProductList(List<DataModel> products){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: MasonryGridView.count(
          // padding: EdgeInsets.symmetric(horizontal: 16.w),
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index){
            final product = products[index];

            final isLeft = index % 2 == 0;
            final height = isLeft
                ? (index % 4 == 0 ? 240.h : 280.h)
                : (index % 4 == 1 ? 280.h : 240.h);
            return InkWell(
              onTap: (){
                print("Tapped: ${product.title}");
              },
              child: Container(
                // height: (index % 2 == 3 || index % 2 == 0) ? 300.h : 240.h,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6.r,
                      offset: Offset(0, 3)
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),

                      child: Image.asset(
                        product.imagePath,
                        height: height * 0.63,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            product.subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            product.price,
                            style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              ...List.generate(5, (index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 12.sp,
                              )),
                              SizedBox(width: 4.w),
                              Text(
                                ("${product.reviews}"),
                                style: GoogleFonts.montserrat(
                                  fontSize: 10.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),),
                    )
                  ],
                ),
              ),
            );

      }),
    );
  }
}
