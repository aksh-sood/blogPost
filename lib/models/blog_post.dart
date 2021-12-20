import 'package:intl/intl.dart';

class BlogPost {
  String title;
  String body;
  DateTime publishedDate;

  BlogPost(
    this.title,
    this.publishedDate,
    this.body,
  );
  String get date => DateFormat('d MMMM y').format(publishedDate);
}
