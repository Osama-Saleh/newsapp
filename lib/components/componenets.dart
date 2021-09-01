import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/web_view/webview.dart';
// import 'package:news_app/cubit/cubit.dart';

Widget buildItems(articles, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewScreen(articles["url"])));
    },
    child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${articles["urlToImage"]}"))),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${articles["title"]}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    "${articles["publishedAt"]}",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validate,
  required IconData prefIcons,
  IconData? sufIcons,
  required String label,
  Function()? ontap,
  BuildContext? context,
  Function(String)? onchange,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    validator: validate,
    decoration: InputDecoration(
        prefixIcon: Icon(prefIcons),
        suffixIcon: Icon(sufIcons),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(15.0),
        )),
    onTap: ontap,
    onChanged: onchange,
  );
}
