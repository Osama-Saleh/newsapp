import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/componenets.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ///
        List list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: defaultFormField(
                  controller: controller,
                  type: TextInputType.text,
                  onchange: (String value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Search must not be empty";
                    }
                    return null;
                  },
                  prefIcons: Icons.search,
                  label: "Search",
                  // ontap: () {
                  //   if (formKey.currentState!.validate()) {
                  //     print(controller.text);
                  //   }
                  // },
                ),
              ),
              Expanded(
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildItems(list[index], context),
                      separatorBuilder: (context, index) => Container(
                            height: 1,
                            color: Colors.grey[300],
                          ),
                      itemCount: list.length)),
            ],
          ),
        );
      },
    );
  }
}
