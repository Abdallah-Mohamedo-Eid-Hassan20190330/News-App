import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app_new_sdk/cubit/news_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app_new_sdk/cubit/news_cubit.dart';
import 'package:news_app_new_sdk/network/remote/dio_helper.dart';
import 'package:news_app_new_sdk/shared/constants.dart';
import 'package:news_app_new_sdk/shop_app/login_register/login_screen.dart';
import 'package:news_app_new_sdk/shop_app/on_boarding_welcome/on_boarding.dart';
import 'package:news_app_new_sdk/shop_app/login_register/register_screen.dart';
import 'package:news_app_new_sdk/whats_app_sending/main_layout.dart';

import 'network/local/cache_helper.dart';
import 'news_layout/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  runApp(
    MyApp(),
  );
}

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          button: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getData(url: "v2/top-headlines", map: {
          "country": "eg",
          "category": "business",
          "apiKey": "$apiKey",
        }),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return MaterialApp(
            home: NewsLayout(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  centerTitle: true,
                  elevation: 0.0,
                ),
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  elevation: 0.0,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                )),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepPurple,
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black,
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Colors.black26,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                centerTitle: true,
                elevation: 0.0,
              ),
              scaffoldBackgroundColor: HexColor("123456"),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 0.0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepPurple,
              ),
            ),
            themeMode: cubit.isLight ? ThemeMode.light : ThemeMode.dark,
          );
        },
      ),
    );
  }
}
