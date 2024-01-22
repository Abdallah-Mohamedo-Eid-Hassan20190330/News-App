import 'package:news_app_new_sdk/cubit/news_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../modules/news_app/business_screen.dart';
import '../modules/news_app/science_screen.dart';
import '../modules/news_app/sports_screen.dart';
import '../network/local/cache_helper.dart';
import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsStates());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  bool isLight = CacheHelper.getBoolData("isLight") ?? true;
  TextEditingController search = TextEditingController();

  List<BottomNavigationBarItem> bottomList = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
  ];
  Map<String, dynamic> businessList = {};
  Map<String, dynamic> scienceList = {};
  Map<String, dynamic> sportsList = {};
  Map<String, dynamic> searchList = {};
  void changeBottomNavFun(int val) {
    currentIndex = val;
    emit(changeBottomNav());
  }

  void getData({required String url, required Map<String, dynamic> map}) {
    switch (map["category"]) {
      case "business":
        if (businessList.isEmpty)
          DioHelper.getData(path: url, query: map).then((value) {
            businessList = value.data;
            print("// fetched new $businessList");
            emit(GetDataState());
          });
        else
          print(businessList);
        break;
      case "science":
        if (scienceList.isEmpty)
          DioHelper.getData(path: url, query: map).then((value) {
            scienceList = value.data;
            print("// fetched new $scienceList");
            emit(GetDataState());
          });
        else
          print(scienceList);
        break;
      case "sports":
        if (sportsList.isEmpty)
          DioHelper.getData(path: url, query: map).then((value) {
            sportsList = value.data;
            print("// fetched new $sportsList");
            emit(GetDataState());
          });
        else
          print(sportsList);
        break;
    }
  }

  void getDataSearch(String url, String keyword) {
    DioHelper.getData(
            path: url,
            query: {"q": keyword, "apiKey": "ec09ab6f9146446e846634bb2d77331d"})
        .then((value) {
      searchList = value.data;
      // print(searchList);
    });
  }

  void chageTheme() {
    isLight = !isLight;
    CacheHelper.setBoolData("isLight", isLight);
    emit(ChangeTheme());
  }

  void changeSearchList(String keyword) {
    getDataSearch("v2/everything", keyword);
    emit(ChangeSearchList());
  }
}
