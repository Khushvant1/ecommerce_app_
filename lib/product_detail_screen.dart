import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> sizes = ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 250.h,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                ),
                items: List.generate(
                  5,
                      (index) => ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1606813909026-7d5b3273608b',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text('Size: 7UK', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8.h),
              Wrap(
                spacing: 8.w,
                children: sizes.map((size) {
                  return ChoiceChip(
                    label: Text(size),
                    selected: size == '7 UK',
                    selectedColor: Colors.red.shade100,
                    labelStyle: TextStyle(
                      color: size == '7 UK' ? Colors.red : Colors.black,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16.h),
              Text('Nike Sneakers', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 4.h),
              Text('Vision Alta Men’s Shoes Size (All Colours)', style: TextStyle(color: Colors.grey.shade600)),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  SizedBox(width: 4.w),
                  Text('4.2', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 4.w),
                  Text('56,890')
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text('₹2,999', style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)),
                  SizedBox(width: 10.w),
                  Text('₹1,500', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 10.w),
                  Text('50% Off', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 12.h),
              Text('Product Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
              SizedBox(height: 4.h),
              Text(
                'Perhaps the most iconic sneaker of all-time, this original "Chicago" colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time...',
                style: TextStyle(color: Colors.grey.shade800),
              ),
              SizedBox(height: 12.h),
              Wrap(
                spacing: 8.w,
                children: [
                  FilterChip(label: Text('Nearest Store'), onSelected: (_) {}),
                  FilterChip(label: Text('VIP'), onSelected: (_) {}),
                  FilterChip(label: Text('Return policy'), onSelected: (_) {}),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart),
                      label: Text('Go to cart'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.flash_on),
                      label: Text('Buy Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
