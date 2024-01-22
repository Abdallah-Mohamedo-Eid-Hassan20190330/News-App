import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_sdk/network/remote/dio_helper.dart';

import '../cubit/news_cubit.dart';
import '../cubit/news_states.dart';
import '../modules/news_app/search_screen.dart';
import '../shared/constants.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("News App"),
              actions: [
                IconButton(
                    onPressed: () {
                      cubit.chageTheme();
                    },
                    icon: Icon(Icons.brightness_4_outlined)),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                  },
                  icon: Icon(Icons.search),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomList,
              currentIndex: cubit.currentIndex,
              onTap: (val) {
                cubit.changeBottomNavFun(val);
                switch (val) {
                  case 0:
                    cubit.getData(url: "v2/top-headlines", map: {
                      "country": "eg",
                      "category": "business",
                      "apiKey": "$apiKey",
                    });
                    break;
                  case 1:
                    cubit.getData(url: "v2/top-headlines", map: {
                      "country": "eg",
                      "category": "science",
                      "apiKey": "$apiKey",
                    });
                    break;
                  case 2:
                    cubit.getData(url: "v2/top-headlines", map: {
                      "country": "eg",
                      "category": "sports",
                      "apiKey": "$apiKey",
                    });
                    break;
                }
              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        });
  }
}
