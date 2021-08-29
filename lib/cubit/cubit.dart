import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business/business.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/science/science.dart';
import 'package:news_app/setting/setting.dart';
import 'package:news_app/sports/sports.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currenIndex = 0;

  List<BottomNavigationBarItem> buttomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "اعمال"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "رياضة"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "علوم"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "إعدادات"),
  ];

  List<Widget> screen = [Business(), Sports(), Science(), Setting()];

  void changebutton(int index) {
    currenIndex = index;
    if (index == 1) {
      getSport();
    }
    if (index == 2) {
      getScience();
      emit(NewGetScienceSuccessState());
    }
    emit(NewBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewGetBusinessLoadState());
    DioHelper.getData(path: "v2/top-headlines", query: {
      "country": "eg",
      "category": "business",
      "apikey": "6b8bf5ca6c83407db71f436fe6f1628c",
    }).then((value) {
      business = value.data["articles"];
      // print(value.data["articles"][0]["title"]);
      print(business[0]["title"]);
      emit(NewGetBusinessSuccessState());
    }).catchError((onError) {
      print("Errors$onError");
      emit(NewGetBusinessErrorState(onError.toString()));
    });
  }

  List<dynamic> sport = [];
  void getSport() {
    emit(NewGetSportLoadState());
    DioHelper.getData(path: "v2/top-headlines", query: {
      "country": "eg",
      "category": "sports",
      "apikey": "6b8bf5ca6c83407db71f436fe6f1628c",
    }).then((value) {
      sport = value.data["articles"];
      // print(value.data["articles"][0]["title"]);
      print(sport[0]["title"]);
      emit(NewGetSportSuccessState());
    }).catchError((onError) {
      print("Errors$onError");
      emit(NewGetSportErrorState(onError.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewGetScienceLoadState());
    DioHelper.getData(path: "v2/top-headlines", query: {
      "country": "eg",
      "category": "science",
      "apikey": "6b8bf5ca6c83407db71f436fe6f1628c",
    }).then((value) {
      science = value.data["articles"];
      // print(value.data["articles"][0]["title"]);
      print(science[0]["title"]);
      emit(NewGetScienceSuccessState());
    }).catchError((onError) {
      print("Errors$onError");
      emit(NewGetScienceErrorState(onError.toString()));
    });
  }

  bool isDark = false;

  void changeDarkMode() {
    isDark = !isDark;
    emit(NewChangeModeState());
  }
}
