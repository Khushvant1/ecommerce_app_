import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/Models/item_model.dart';
import 'package:ecommerce_app/Models/product_model.dart';
import 'package:ecommerce_app/common/login_screen.dart';
import 'package:ecommerce_app/screens/favorite_screen.dart';
import 'package:ecommerce_app/screens/search_screen.dart';
import 'package:ecommerce_app/screens/setting_screen.dart';
import 'package:ecommerce_app/screens/shop_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global/global_file.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final List<String> bannerList = [
    'assets/images/banner_img1.jpg',
    'assets/images/banner_img2.jpg',
    'assets/images/banner_img3.jpg'
  ];

  final List<ProductModel> dummyProducts = [
    ProductModel(
      imagePath: 'assets/images/woman_kurta_img.jpg',
      title: 'Women Printed Kurta',
      subtitle: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: '₹1500',
      oldPrice: '₹2499',
      discount: '40%Off',
      rating: '4.3',
      reviews: '56890',
    ),
    ProductModel(
      imagePath: 'assets/images/shoes_img.jpg',
      title: 'HRX by Hrithik Roshan',
      subtitle: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: '₹2499',
      oldPrice: '₹4999',
      discount: '50%Off',
      rating: '4.3',
      reviews: '344567',
    ),
  ];

  final List<ItemModel> dummyItems = [
    ItemModel(
        imagePath: "assets/images/watch_img.jpg",
        title: "IWC Schaffhausen 2021 Pilot's Watch 'SIHH 2019' 44mm",
        price: "₹650",
        oldPrice: "₹1599",
        discount: "60%off"
    ),
    ItemModel(
        imagePath: "assets/images/sneaker_shoes_img.jpg",
        title: "Labin White Sneakers For Men and Female",
        price: "₹650",
        oldPrice: "₹1250",
        discount: "70%off"
    ),
    ItemModel(
        imagePath: 'assets/images/woman_kurta_img.jpg',
        title: "Women Printed Kurta",
        price: '₹1500',
        oldPrice: '₹2499',
        discount: '40%Off',)
  ];
  int currentBanner = 0;
  // final GlobalKey<CarouselSliderState> _carouselKey = GlobalKey();
  TextEditingController searchController = TextEditingController();
  final CarouselSliderController _carouselSliderController = CarouselSliderController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();
  final ScrollController scrollController = ScrollController();

  void scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 200.w,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void onScrollRight(){
    scrollController.animateTo(
      scrollController.offset + 200.w,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: Colors.white,
      appBar: GlobalFile.appBarUI(
        context,
        scaffoldKey: _scaffoldKey,
      ),
      drawer: Drawer(

      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 52.h),
        // color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
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
                Text('All Featured', style: GoogleFonts.montserrat(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
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
            Card(
              color: Colors.white,
              margin: EdgeInsets.only(left: 16.w),
              elevation: 0,
              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(12.r),
                    bottomLeft: Radius.circular(12.r),
                  ),
              ),
              // clipBehavior: Clip.hardEdge,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: SizedBox(
                  height: 70.h,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    children: [
                      categoryItem("assets/images/beauty_img.png", 'Beauty'),
                      categoryItem("assets/images/fashion.png", 'Fashion'),
                      categoryItem("assets/images/kids_img.png", 'Kids'),
                      categoryItem("assets/images/mens_img.png", 'Mens'),
                      categoryItem("assets/images/women_img.png", 'Womens'),
                    ],
                  )
                ),
              ),
            ),
            //
            // SizedBox(
            //   height: 260.h,
            //   child:
            SizedBox(height: 12.h),
              Column(
                children: [
                  if (bannerList != null && bannerList.isNotEmpty)
                  CarouselSlider(
                    // key: _carouselKey,
                    carouselController: _carouselSliderController,
                    items: bannerList.map((imgPath){
                      return Builder(
                          builder: (BuildContext context){
                            return Container(
                              height: 180.h,
                              // width: 343.w,
                              margin: EdgeInsets.symmetric(horizontal: 8.w),
                              padding: EdgeInsets.symmetric(horizontal:16.w, vertical: 16.h),
                              decoration: BoxDecoration(
                                color: Colors.pink.shade100,
                                borderRadius: BorderRadius.circular(12.r),
                                image: DecorationImage(
                                    image: AssetImage(imgPath),
                                fit: BoxFit.cover,
                                alignment: Alignment.centerRight
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('50-40% OFF',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white
                                          )
                                            ),
                                          SizedBox(height: 6.h),
                                          Text('Now in (Product)',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white
                                          )),
                                          // SizedBox(height: 6.h),
                                          Text('All colours',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white
                                          )),
                                          SizedBox(height: 12.h),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(6.r),
                                              border: Border.all(color: Colors.white, width: 1.w),
                                              // color: Colors.pinkAccent,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Shop Now',
                                                    style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w600,
                                                      height: 1.2.h,
                                                    ),
                                                  ),
                                                  SizedBox(width: 8.w),
                                                  Icon(Icons.arrow_forward, color: Colors.white, size: 18.sp),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20.w),
                                        ],
                                      )
                                  )
                                ],
                              ),
                            );
                          });
                    }).toList(),
                    options: CarouselOptions(
                      height: 150.h,
                      autoPlay: true,
                      // aspectRatio: 16/9,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      onPageChanged: (index,reason){
                        setState(() {
                          currentBanner = index;
                        });
                      }
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: bannerList.asMap().entries.map((entry){
                      return GestureDetector(
                        onTap: () {
                          _carouselSliderController.animateToPage(entry.key);
                        },
                        child: Container(
                        width: currentBanner == entry.key ? 10.w : 8.w,
                      height: 8.w,
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentBanner == entry.key
                      ? Colors.pink.shade100
                          : Colors.grey.shade300,
                        ),
                        )
                      );
                    }).toList(),
                  )
                ],
              ),
            // )
            SizedBox(height: 16.h),
            Container(
              // height: 60.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(8.r)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Deal of the Day',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Colors.white
                          ),),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Icon(Icons.access_alarm, color: Colors.white, size: 16.sp,),
                              SizedBox(width:4.w),
                              Text('22h 55m 20s remaining',
                              style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                color: Colors.white
                              ),)
                            ],
                          )
                        ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: (){

                          },
                          child: Text(
                              'View all',
                              style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                            ),
                        ),
                        SizedBox(width: 6.w),
                        Icon(Icons.arrow_forward, color: Colors.white, size: 16.sp),
                      ],
                    ),
                  )
                   ]
                  ),
            ),
            SizedBox(height: 12.h),
        horizontalProductList(dummyProducts),
            // SizedBox(height: 4.h),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.r,
                    offset: Offset(0, 2),
                    color: Colors.white.withOpacity(0.05),
                  )]
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/special_offer_img.png',
                    height: 60.h,
                    width: 75.w,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Special Offers',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          ),),
                          SizedBox(height: 4.h),
                          Text(
                            'We make sure you gate the offer you need at best prices',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                              color: Colors.black
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            // SizedBox(height: 2.h),
            Container(
              height: 172.h,
              width: 343.w,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  // Yellow gradient strip
                  Container(
                    width: 11.w,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow.shade700,
                          Colors.yellow.shade400,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(12.r),
                      //   bottomLeft: Radius.circular(12.r),
                      // ),
                    ),
                  ),

                  // Heels Image
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Image.asset(
                      'assets/images/Rectangle.jpg',
                      height: 108.h,
                      width: 144.w,
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Right Side Text and Button
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Heading
                          Text(
                            'Flat and Heels',
                            style: GoogleFonts.montserrat(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4.h),

                          // Subheading
                          Text(
                            'Stand a chance to get rewarded',
                            // textAlign: TextAlign.start,
                            maxLines: 1,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 12.h),

                          // Visit Now Button bottom-right
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                  color: Colors.redAccent.shade200,
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Visit Now',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    Icon(Icons.arrow_forward, size: 18.sp, color: Colors.white),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12.h),
            Container(
              // height: 60.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  color: Colors.red.shade300,
                  borderRadius: BorderRadius.circular(8.r)
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tranding Products',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.white
                          ),),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(Icons.date_range_outlined, color: Colors.white, size: 16.sp,),
                            SizedBox(width:4.w),
                            Text('Last Date 29/02/25',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  color: Colors.white
                              ),)
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Row(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: (){
                              ///////
                            },
                            child: Text(
                              'View all',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Icon(Icons.arrow_forward, color: Colors.white, size: 16.sp),
                        ],
                      ),
                    )
                  ]
              ),
            ),
            SizedBox(height: 12.h),
            horizontalItemList(dummyItems),
            SizedBox(height: 12.h),
            Container(
              height: 270.h,
              width: 343.w,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r)
                    ),
                    child: Image.asset(
                      "assets/images/summer_img.jpg",
                      height: 200.h,
                      width: 343.w,
                      // width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('New Arrivals',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: Colors.black
                              ),),
                            SizedBox(height: 4.h),
                            Text(
                              'Summer’ 25 Collections',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Container(
                            height: 28.h,
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: Colors.redAccent.shade200
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'View all',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 16.sp,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),

            ),
            SizedBox(height: 16.h),
            Container(
              height: 324.h,
              width: 383.w,
              margin: EdgeInsets.only(left: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.only()
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 8.h, left: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sponserd',
                      style: GoogleFonts.montserrat(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      ),
                    ),
                    // SizedBox(height: 6.h),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          bottomLeft: Radius.circular(8.r)
                      ),
                      child: Image.asset(
                        'assets/images/sponserd_img.jpg',
                        height: 260.h,
                        width: 351.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'up to 50% off',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black
                                  ),
                                ),
                              ],

                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: GestureDetector(
                                onTap: (){
                                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
  categoryItem(String imagePath, label){
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: InkWell(
        onTap: (){
          print("tapped on : $label");
        },
        // borderRadius: BorderRadius.circular(100.r),
        child: Column(
          children: [
            ClipOval(
              child: Container(
                height: 50.h,
                width: 56.w,
                color: Colors.white,
                child: Image.asset(
                  // height: 52.h,
                  // width: 56.w,
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Text(label,
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black
            ),)
          ],
        ),
      ),
    );
  }

  horizontalProductList(List<ProductModel> products){
    return SizedBox(
      height: 220.h,
      // width: 340.w,
      child: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: products.length,
            // separatorBuilder: (_, __) => SizedBox(width: 4.w),
            itemBuilder: (context, index){
              final product = products[index];
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Container(
                  height: 241.h,
                  width: 170.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: Offset(0,2)
                    )
                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: Image.asset(
                          product.imagePath,
                          height: 120.h,
                          width: 170.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              product.subtitle,
                              style: GoogleFonts.montserrat(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                Text(product.price,
                                style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                                ),),
                        ]
                      ),
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    Text(product.oldPrice,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10.sp,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough
                                    ),),
                                SizedBox(width: 4.w),
                                Text(product.discount,
                                style: GoogleFonts.montserrat(
                                  fontSize: 10.sp,
                                  color: Colors.redAccent
                                ),),
                                  ],
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
                        ),
                      ),
                    ],

                  ),

                ),
              );
            },

          ),
          Positioned(
            right: 6.w,
            top: 100.h,
            child: GestureDetector(
              onTap: scrollRight,
              child: Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(Icons.chevron_right, size: 22.sp),
              ),
            ),
          ),
        ],
      ),

    );
  }

  horizontalItemList(List<ItemModel> items){
    return SizedBox(
      height: 186.h,
      width: 340.w,
      child: Stack(
        children: [
          ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: items.length,
            // separatorBuilder: (_, __) => SizedBox(width: 4.w),
            itemBuilder: (context, index){
              final item = items[index];
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Container(
                  height: 186.h,
                  width: 142.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                            offset: Offset(0,2)
                        )
                      ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: Image.asset(
                          item.imagePath,
                          height: 100.h,
                          width: 142.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Row(
                                children: [
                                  Text(item.price,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black
                                    ),),
                                ]
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              children: [
                                Text(item.oldPrice,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10.sp,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough
                                  ),),
                                SizedBox(width: 4.w),
                                Text(item.discount,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10.sp,
                                      color: Colors.redAccent
                                  ),),
                              ],
                            ),
                            // SizedBox(height:.h),
                          ],
                        ),
                      )
                    ],
                  ),

                ),
              );
            },
          ),
          Positioned(
            right: 8.w,
            top: 80.h,
            child: GestureDetector(
              onTap: onScrollRight,
              child: Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(Icons.chevron_right, size: 22.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
