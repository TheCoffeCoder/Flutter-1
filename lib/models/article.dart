import 'package:easy_localization/easy_localization.dart';
import 'package:jiffy/jiffy.dart';
import 'package:wordpress_app/config/wp_config.dart';

class Article {
  final int? id;
  final String? title;
  final String? content;
  final String? image;
  final String? video;
  final String? author;
  final String? avatar;
  final String? category;
  final String? date;
  final String? timeAgo;
  final String? link;
  final int? catId;
  final List? tags;

  Article(
      {this.id,
      this.title,
      this.content,
      this.image,
      this.video,
      this.author,
      this.avatar,
      this.category,
      this.date,
      this.timeAgo,
      this.link,
      this.catId,
      this.tags});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        id: json['id'] ?? 0,
        title: json['title']['rendered'] ?? '',
        content: json['content']['rendered'] ?? '',
        image: json["_embedded"]["wp:featuredmedia"][0]["source_url"] != false
            ? json["_embedded"]["wp:featuredmedia"][0]["source_url"]
            : WpConfig.randomPostFeatureImage,
        video: "https://www.youtube.com/watch?v=lzLUdYZCLOc",
        author: json["_embedded"]['author'][0]['name'] ?? '',
        avatar:
            'https://icon-library.com/images/avatar-icon/avatar-icon-27.jpg',
        date: DateFormat('dd MMMM, yyyy', 'en_US')
            .format(DateTime.parse(json["date"]))
            .toString(),
        //timeAgo: Jiffy(json["date"]).fromNow(),
        timeAgo: Jiffy(json['date']).add(hours: 6).fromNow(),
        link: json['link'] ?? 'empty',
        category: "Blog Category",
        catId: 0,
        tags: json['tags']);
  }
}
