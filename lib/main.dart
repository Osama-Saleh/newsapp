import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/layout/news_app.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/network/remote/local/chach_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBool(key: "isDark");
  // bool? isDark = false;

  runApp(MyApp(isDark!));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getBusiness()
        ..changeDarkMode(fromShared: isDark),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              /// primarySwatch is color for CircularProgressIndicator()
              primarySwatch: Colors.cyan,
              scaffoldBackgroundColor: Colors.white,
              floatingActionButtonTheme:
                  FloatingActionButtonThemeData(backgroundColor: Colors.cyan),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.cyan,

                  ///Using it when # of items BottomNavigationBar more than 3
                  type: BottomNavigationBarType.fixed),
              appBarTheme: AppBarTheme(
                  titleSpacing: 25,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                  actionsIconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  color: Colors.white,
                  elevation: 0.0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  )),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: HexColor("082A37"),
                ),
              ),
            ),
            darkTheme: ThemeData(
              /// primarySwatch is color for CircularProgressIndicator()
              primarySwatch: Colors.cyan,
              scaffoldBackgroundColor: HexColor("082A37"),
              floatingActionButtonTheme:
                  FloatingActionButtonThemeData(backgroundColor: Colors.cyan),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.cyan,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: HexColor("082A37"),

                  ///Using it when # of items BottomNavigationBar more than 3
                  type: BottomNavigationBarType.fixed),
              appBarTheme: AppBarTheme(
                  titleSpacing: 25,
                  color: HexColor("082A37"),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                  actionsIconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor("082A37"),
                    statusBarIconBrightness: Brightness.light,
                  )),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: NewsApp(),
          );
        },
      ),
    );
  }
}
