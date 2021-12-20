import 'package:blog_provider/models/blog_post.dart';
import 'package:blog_provider/models/user.dart';
import 'package:blog_provider/widget/blog_list_tile.dart';
import 'package:blog_provider/widget/blog_scaffold.dart';
import 'package:blog_provider/widget/constrained_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<List<BlogPost>>(context);
    final user = Provider.of<User>(context);
    return BlogScaffold(
      children: [
        ConstrainedCentre(
          child: CircleAvatar(
            radius: 54.r,
            backgroundImage: NetworkImage(user.profilePic),
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        ConstrainedCentre(
            child: SelectableText(user.name,
                style: Theme.of(context).textTheme.headline1)),
        SizedBox(
          height: 40.h,
        ),
        SelectableText(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
            style: Theme.of(context).textTheme.bodyText2),
        SizedBox(
          height: 40.h,
        ),
        SelectableText("Blog", style: Theme.of(context).textTheme.headline1),
        for (var p in post) BlogListTile(post: p),
      ],
    );
  }
}
