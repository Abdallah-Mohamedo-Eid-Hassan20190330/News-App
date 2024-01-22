import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/news_app/web_view_screen.dart';

Widget separator() {
  return Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey,
  );
}

Widget ListBuilder(int index, List<dynamic> list, context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(list[index]["url"]),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.skynewsarabia.com/images/v1/2023/08/05/1642855/1100/619/1-1642855.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              list[index]["title"],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    ),
  );
}
