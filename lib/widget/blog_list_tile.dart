import 'package:blog_provider/models/blog_post.dart';
import 'package:blog_provider/screens/blog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BlogListTile extends StatelessWidget {
  const BlogListTile({Key? key, this.post}) : super(key: key);
  final BlogPost? post;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 20.h),
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => BlogPage(blogPost: post),
            ),
          );
        },
        child:
            Text(post!.title, style: const TextStyle(color: Colors.blueAccent)),
      ),
      SizedBox(height: 20.h),
      SelectableText(post!.date, style: Theme.of(context).textTheme.caption),
    ]);
  }
}
