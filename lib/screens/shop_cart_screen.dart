import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/cart_model.dart';
import '../global/global_file.dart';
import 'checkout_screen.dart';

class ShopCartScreen extends StatefulWidget {
  const ShopCartScreen({super.key});

  @override
  State<ShopCartScreen> createState() => _ShopCartScreenState();
}

class _ShopCartScreenState extends State<ShopCartScreen> {
  int currentBanner = 0;
  String selectedSize = "7 UK";


  final List<String> bannerList = [
    'assets/images/sneaker_shoes_img.jpg',
    'assets/images/banner_img1.jpg',
    'assets/images/banner_img2.jpg',
    'assets/images/banner_img3.jpg',
    'assets/images/woman_kurta_img.jpg'
  ];

  final List<CartModel> dummyProducts = [
    CartModel(
      imagePath: 'assets/images/woman_kurta_img.jpg',
      title: 'Women Printed Kurta',
      subtitle: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: '₹1500',
      rating: '4.3',
      reviews: '56890',
    ),
    CartModel(
      imagePath: 'assets/images/shoes_img.jpg',
      title: 'HRX by Hrithik Roshan',
      subtitle: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: '₹2499',
      rating: '4.3',
      reviews: '344567',
    ),
  ];
  final CarouselSliderController _carouselSliderController = CarouselSliderController();

  final ScrollController _scrollController = ScrollController();

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: IconButton(
              onPressed: (){
                // Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded, size: 16, color: Colors.black)),
        ),
        // title: Text("Checkout", style: GoogleFonts.montserrat(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),),
        // centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  shape: BoxShape.circle
              ),
              child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.shopping_cart_outlined, size: 20, color: Colors.black,)),
            ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.h, left: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (bannerList.isNotEmpty)
                Stack(
                  children: [
                        CarouselSlider(
                            carouselController: _carouselSliderController,
                        items: bannerList.map((imgPath){
                          return Builder(
                              builder: (BuildContext context){
                                return Container(
                                  // height: 180.h
                                  // margin: EdgeInsets.symmetric(horizontal: 4.w),
                                  padding: EdgeInsets.symmetric(horizontal:16.w, vertical: 16.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.r),
                                    image: DecorationImage(
                                        image: AssetImage(imgPath),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.centerRight
                                    ),
                                  ),

                                );
                              });
                        }).toList(),
                        options: CarouselOptions(
                          height: 150.h,
                          // autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.9,
                            onPageChanged: (index,reason){
                              setState(() {
                                currentBanner = index;
                              });
                            }
                        )),
                    Positioned(
                      right: 36.w,
                      top: 60.h,
                      child: GestureDetector(
                        onTap:  (){
                          _carouselSliderController.nextPage();
                        },
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
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    "Size: 7Uk",
                    style: GoogleFonts.montserrat(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    GlobalFile.sizeBox("6 UK", selectedSize == "6 UK", () {
                      setState(() {
                        selectedSize = "6 UK";
                      });
                    }),
                    GlobalFile.sizeBox("7 UK", selectedSize == "7 UK", () {
                      setState(() {
                        selectedSize = "7 UK";
                      });
                    }),
                    GlobalFile.sizeBox("8 UK", selectedSize == "8 UK", () {
                      setState(() {
                        selectedSize = "8 UK";
                      });
                    }),
                    GlobalFile.sizeBox("9 UK", selectedSize == "9 UK", () {
                      setState(() {
                        selectedSize = "9 UK";
                      });
                    }),
                    GlobalFile.sizeBox("10 UK", selectedSize == "10 UK", () {
                      setState(() {
                        selectedSize = "10 UK";
                      });
                    }),
                  ],
                ),
                SizedBox(height: 12.h),

                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NIke Sneakers",
                        style: GoogleFonts.montserrat(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Vision Alta Men's Shoes Size (All Colours)",
                        style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          ...List.generate(5, (index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16.sp,
                          )),
                          SizedBox(width: 4.w),
                          Text(
                            ("56,890"),
                            style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Text(
                            "₹2,999",
                            style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "₹1,500",
                            style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "50% Off",
                            style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.redAccent.shade100,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Product Details",
                        style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text.rich(
                        TextSpan(
                          text:
                          "Perhaps the most iconic sneaker of all-time, this original “Chicago” colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Micheal Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the...",
                          style: GoogleFonts.montserrat(fontSize: 12.sp, fontWeight: FontWeight.w400, color: Colors.black),
                          children: [
                            TextSpan(
                              text: "More",
                              style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                color: Colors.redAccent.shade100,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GlobalFile.iconBox(Icons.location_pin, "Nearest Store"),
                          GlobalFile.iconBox(Icons.lock_outline, "VIP"),
                          GlobalFile.iconBox(Icons.assignment_return_outlined, "Return policy"),
                        ],
                      ),

                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GlobalFile.gradientButtonWithIcon(
                            icon: Icons.shopping_cart_outlined,
                            text: "Go to cart",
                            gradientColors: [Colors.blue.shade700, Colors.blueAccent],
                            onTap: () {
                              // Go to cart logic
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen()));
                            },
                          ),
                          SizedBox(width: 4.w),
                          GlobalFile.gradientButtonWithIcon(
                            icon: Icons.touch_app_outlined,
                            text: "Buy Now",
                            gradientColors: [Colors.green.shade400, Colors.greenAccent],
                            onTap: () {
                              // Buy Now logic
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 12.h),
                      Container(
                        margin: EdgeInsets.only(right: 16.w),
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade100,
                          borderRadius: BorderRadius.circular(5.r)
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Delivery in",
                                    style: GoogleFonts.montserrat(fontSize: 13.sp, fontWeight: FontWeight.w600, color: Colors.black),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    "1 within Hour",
                                    style: GoogleFonts.montserrat(fontSize: 19.sp, fontWeight: FontWeight.w600, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GlobalFile.iconWithContainer(
                            icon: Icons.visibility_outlined,
                            text: "View Similar",
                          ),
                          SizedBox(width: 4.w),
                          GlobalFile.iconWithContainer(
                            icon: Icons.mobile_friendly,
                            text: "Add to Compare",
                          )
                        ],
                      ),
                      SizedBox(height: 12.h),

                      Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Similar To', style: GoogleFonts.montserrat(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('282+ Iteams', style: GoogleFonts.montserrat(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
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
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 12.h),
                      horizontalProductList(dummyProducts),

                      SizedBox(height: 88.h)

                    ],
                  ),
                )


              ],

            ),
          ),

        ],
      )
      
    );
  }

  void scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 200.w,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  horizontalProductList(List<CartModel> products){
    return SizedBox(
      height: 212.h,
      // width: 340.w,
      child: Stack(
        children: [
          ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(right: 16.w),
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
        ],
      ),

    );
  }
}
