import 'package:blog_provider/models/blog_post.dart';
import 'package:blog_provider/models/user.dart';
import 'package:blog_provider/widget/blog_list_tile.dart';
import 'package:blog_provider/widget/blog_scaffold.dart';
import 'package:blog_provider/widget/constrained_center.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<List<BlogPost>>(context);
    final user = Provider.of<User>(context);

    return BlogScaffold(
      children: [
        ConstrainedCentre(
          child: CircleAvatar(
            radius: 54.r,
            backgroundImage: NetworkImage(
                user.profilePic ?? 'https://picsum.photos/id/237/200/300'),
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        ConstrainedCentre(
            child: SelectableText(user.name ?? "Flutter Dev",
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
