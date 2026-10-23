// Run the app and move between the pages. Then answer these in a comment at the top of main.dart:
// a) Which methods run when a page opens for the first time?
// initState(), didChangeDependencies(),build()
// b) Which method runs again after you press the heart button?
// build()
// c) Which methods run when you leave a page and go back?
// deactivate() ,dispose()run when a widget is removed from the
// widget tree, then initState(),didChangeDependencies(),build() when going back .
// d) Which methods run when you resize the browser window, and why?
// When I resize the browser window, didChangeDependencies() runs again because the MediaQuery dependency changes.,
// and build() runs again to update the UI according to the new screen size.
// In my Products page, this allows the app to switch between
// ListView when the width is less than 600 pixels and GridView when the width is 600 pixels or more.



// Part 4 – Short answers (in a comment at the top of main.dart)
// 1. What is the difference between context.go and context.push? ------ not using GoRouter to know difference yet
// 2. Why did we use go for Login → Products and push for Product؟--------
// 3. What is the difference between a path parameter and a query parameter? --------.




import 'package:flutter/material.dart';
import 'package:products_app/screens/login.dart';
import 'package:products_app/screens/product.dart';
import 'package:products_app/screens/product_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        "/login":(context)=>Login(),
        "/product":(context)=>Product(),
        "/Product_details":(context)=>ProductDetails()
      },
      home:Login()
    );
  }
}
