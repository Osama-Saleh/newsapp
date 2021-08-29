import 'package:flutter/material.dart';
// import 'package:news_app/cubit/cubit.dart';

Widget buildItems(articles, context) {
  return Padding(
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
  );
}
