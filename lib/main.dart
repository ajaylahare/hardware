import 'package:flutter/material.dart';
import 'package:hardware/auth/auth_screen.dart';
import 'package:hardware/drawer_screen/setting_screen.dart';

import 'package:hardware/drawer_screen/buy_again_screen.dart';
import 'package:hardware/drawer_screen/customer_service_screen.dart';
import 'package:hardware/drawer_screen/shopbycategory.dart';
import 'package:hardware/drawer_screen/toaday_deal_screen.dart';
import 'package:hardware/drawer_screen/your%20account_screen.dart';
import 'package:hardware/drawer_screen/your_notifications_screen.dart';
import 'package:hardware/drawer_screen/your_orders._screen.dart';
import 'package:hardware/drawer_screen/your_wishlist_screen.dart';
import 'package:hardware/search/search.dart';
import 'screens1/products_detail_screen.dart';
import './screens2/services_info_reviews_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screens1/shop_list_screen.dart';
import './screens2/services_details_screen.dart';
import './screens1/home_screen.dart';
import './screens1/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          backgroundColor: Colors.pink,
          accentColor: Colors.deepPurple,
          accentColorBrightness: Brightness.dark,
          buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: Colors.pink,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, usersnapshot) {
            if (usersnapshot.hasData) return HomeScreen();
            return AuthScreen();
          }),
      routes: {
        '/setting_screen': (context) => YourSettingScreen(),
        '/search': (context) => Search(),
        '/your_customer_service_screen': (context) =>YourCustomerServiceScreen(),
        '/your_buy_again_screen': (context) => YourBuyAgainScreen(),
        '/your_account_screen': (context) => YourAccountScreen(),
        '/your_wishlist_screen': (context) => YourWishlistScreen(),
        '/your_notify_screen': (context) => YourNotificationScreen(),
        '/your_order_screen': (context) => YourOrderScreen(),
        '/Todays_deal_screen': (context) => TodaysDealScreen(),
        '/Shop_By_Category_screen': (context) => ShopByCategory(),
        '/Home_screen': (context) => HomeScreen(),
        '/auth_screen': (context) => AuthScreen(),
        '/tab_screen': (context) => TabsScreen(),
        '/products_screen': (context) => ProductsDetailScreen(),
        '/service_review_info_screen': (context) => ServicesInfoReviewscreen(),
      },
    );
  }
}
