import 'package:blog_provider/models/blog_post.dart';
import 'package:blog_provider/models/user.dart';
import 'package:blog_provider/widget/constrained_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:blog_provider/widget/blog_scaffold.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key, this.blogPost}) : super(key: key);
  final BlogPost? blogPost;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return BlogScaffold(
      children: [
        ConstrainedCentre(
          child: CircleAvatar(
            radius: 54.r,
            backgroundImage: NetworkImage(
                user.profilePic ?? "https://picsum.photos/id/237/200/300"),
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        ConstrainedCentre(
          child: SelectableText(user.name ?? "Flutter Dev",
              style: Theme.of(context).textTheme.headline5),
        ),
        SizedBox(
          height: 40.h,
        ),
        SelectableText(blogPost!.title,
            style: Theme.of(context).textTheme.headline1),
        SizedBox(
          height: 10.h,
        ),
        SelectableText(blogPost!.date,
            style: Theme.of(context).textTheme.caption),
        SizedBox(
          height: 20.h,
        ),
        SelectableText(blogPost!.body,
            style: Theme.of(context).textTheme.bodyText2),
      ],
    );
  }
}
