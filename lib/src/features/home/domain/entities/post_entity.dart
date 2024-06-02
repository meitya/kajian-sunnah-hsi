import 'package:equatable/equatable.dart';

import 'sub_entities.dart';

class PostEntity extends Equatable {
  final int id;
  final String title;
  final String slug;
  final String excerpt;
  final String content;
  final String status;
  final String imageURL;
  final String viewCount;
  final String likeCount;
  final String dislikeCount;
  final String bookmarkCount;
  final String publishDate;
  final List<UstadzEntity> ustadz;
  final CategoryEntity category;
  final TopicEntity topic;

  const PostEntity(
      {required this.id,
      required this.title,
      required this.slug,
      required this.excerpt,
      required this.content,
      required this.status,
      required this.imageURL,
      required this.viewCount,
      required this.likeCount,
      required this.dislikeCount,
      required this.bookmarkCount,
      required this.publishDate,
      required this.ustadz,
      required this.category,
      required this.topic});

  @override
  List<Object?> get props => [
        id,
        title,
        slug,
        excerpt,
        content,
        status,
        imageURL,
        viewCount,
        likeCount,
        dislikeCount,
        bookmarkCount,
        publishDate,
        ustadz,
        category,
        topic
      ];
}
