import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/common/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _controller = PageController();
  double currentPage = 0;

  @override
  void initState(){
    super.initState();
    _controller.addListener((){
        setState(() {
          currentPage = _controller.page ?? 0;
        });
      }
    );
  }
  final List<Map<String, dynamic>> IntroData = [
    {
      "image": "assets/images/fashion_img.png",
      "title": "Choose Products",
      "desc": "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    },
    {
      "image": "assets/images/payment_img.png",
      "title": "Make Payment",
      "desc": "Secure and easy payment method to complete your purchase in a few steps.",
    },
    {
      "image": "assets/images/order_img.png",
      "title": "Get Your Order",
      "desc": "Easily track your order with real-time updates and notifications.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text("${currentPage.round() +1}/${IntroData.length}", style:GoogleFonts.montserrat(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.black),),
                      RichText(text: TextSpan(
                        style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "${currentPage.round() + 1}",
                            style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w600)
                          ),
                          TextSpan(
                            text: "/${IntroData.length}", // Total pages
                            style: GoogleFonts.montserrat(fontWeight: FontWeight.normal, color: Colors.black), // Normal
                          ),
                        ]
                      )),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                      child: Text("Skip", style: GoogleFonts.montserrat(fontSize: 15.sp, fontWeight: FontWeight.w600,color: Colors.black),)
                      )
                    ],
                  ),
                ),

                Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: IntroData.length,
                      itemBuilder: (context, index){
                        var item = IntroData[index];
                        return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(item["image"]!,height: 220.h, fit: BoxFit.contain,),
                              SizedBox(height: 24.h,),
                              Text(item["title"]!, style: GoogleFonts.montserrat(fontSize: 23.sp, fontWeight: FontWeight.w800, color: Colors.black),),
                              SizedBox(height: 8.h,),
                              Text(item["desc"]!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(color: Colors.grey),)
                            ],
                          ),
                        );
                      }
                    )
                ),

                // Dots
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                    GestureDetector(
                      onTap: (){
                        if(currentPage > 0){
                          _controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                      },
                      child: Text(
                        "Prev",
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          color: currentPage > 0
                            ? Colors.black
                            : Colors.grey.shade300,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    DotsIndicator(
                        dotsCount: IntroData.length,
                        position: currentPage,
                        decorator: DotsDecorator(
                            activeColor: Colors.black,
                            color: Colors.grey[300]!,
                            size: const Size.square(8.0),
                            activeSize: const Size(20.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0.r),
                          )
                        ),
                      ),
                    GestureDetector(
                      onTap: (){
                        if(currentPage < IntroData.length - 1){
                          _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }else{
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        }
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                      child: Text(
                        currentPage.round() == IntroData.length-1
                          ? "Get Started"
                            : "Next",
                      style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        color: Colors.red,
                      fontWeight: FontWeight.w600),)
                       )
                      )
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}
