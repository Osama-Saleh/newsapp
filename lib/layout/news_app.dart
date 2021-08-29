import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
// import 'package:news_app/network/remote/dio_helper.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
            appBar: AppBar(
              title: Text("أخبار اليوم"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {
                    NewsCubit.get(context).changeDarkMode();
                    print(NewsCubit.get(context).isDark);
                  },
                  icon: Icon(Icons.light_mode),
                  iconSize: 30,
                )
              ],
            ),
            body: cubit.screen[cubit.currenIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currenIndex,
              onTap: (index) {
                cubit.changebutton(index);
              },
              items: cubit.buttomItems,
            ));
      },
    );
  }
}
