import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/componenets.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return list.length <= 0
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildItems(list[index],context),
                separatorBuilder: (context, index) => Container(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                itemCount: list.length);
      },
    );
  }
}
