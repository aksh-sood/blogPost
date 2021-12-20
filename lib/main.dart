import 'package:blog_provider/models/blog_post.dart';
import 'package:blog_provider/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() {
  runApp(const MyApp());
}

var themeData = ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black)),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 45, fontWeight: FontWeight.w800, color: Colors.black),
      headline2: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
      bodyText2: TextStyle(fontSize: 22, color: Colors.black),
      caption: TextStyle(fontSize: 18, color: Colors.black),
    ));

final _blogPost = [
  BlogPost("What is Provider?", DateTime(2021, 12, 20),
      "This is the body of the blog and all the data posted will be available to the viewer here"),
  BlogPost("What is MultiProvider", DateTime(2021, 3, 13),
      "This is the body of the blog and all the data posted will be available to the viewer here"),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: ScreenUtil.defaultSize,
        builder: () {
          return MultiProvider(
            providers: [
              Provider<List<BlogPost>>(create: (context) => _blogPost),
              Provider<User>(
                  create: (context) => User(
                      name: "Flutter Dev",
                      profilePic: 'https://picsum.photos/id/237/200/300')),
            ],
            child: MaterialApp(
              title: 'Flutter blog',
              theme: themeData,
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            ),
          );
        });
  }
}
