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
// 1. What is the difference between context.go and context.push?
// context.go() navigates to a destination and changes the current route configuration. It does not keep the current page on top of the navigation stack like push(),so you cannot return to it using the normal back navigation in the same way.
// context.push() adds a new page on top of the current page (Stack Structure),keeping the previous page in the navigation stack and allowing the user to return to it using the Back button.
// allowing the user to return to the previous page.
// 2. Why did we use go for Login →
// We use go() for Login -> Products because we want to navigate
// to the Products page  without keeping the Login page on the navigation stack in the same way as push().
// We use push() for Products -> Details because we want to open
// the details page and return to Products afterward and we don't want the user to return to the Login page by pressing the Back button.”

// 3. What is the difference between a path parameter and a query parameter?
// A path parameter is part of the URL path, such as
// /product_details/1200/Laptop/0.
// A query parameter comes after (?) in the URL, such as
// /products?userName=anyusername.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    return MaterialApp.router(routerConfig: goRouter);
    // MaterialApp(
    //   routes:{
    //     "/login":(context)=>Login(),
    //     "/product":(context)=>Product(),
    //     "/Product_details":(context)=>ProductDetails()
    //   },
    //   home:Login()
    // );
  }
}

//GoRouter Object
final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        //note f me:Know home page by single forward slash
        return Login();
      },
    ),
    GoRoute(
      name: "products",
      path: "/products",
      builder: (context, state) {
        final userName = state.uri.queryParameters["userName"] ?? "";
        return Product(userName: userName);
      },
    ),
    GoRoute(
      name: "product_details",
      path: "/product_details/:price/:name",
      builder: (context, state) {
        final price = int.parse(state.pathParameters["price"]!);
        final name = state.pathParameters["name"] ?? "";
        final icon = state.extra as IconData;
        return ProductDetails(name: name, price: price, icon: icon);
      },
    ),
  ],
);
