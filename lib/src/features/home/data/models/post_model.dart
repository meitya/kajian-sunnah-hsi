import 'package:kajian_sunnah_hsi/src/features/home/data/models/sub_models.dart';
import 'package:kajian_sunnah_hsi/src/features/home/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    required super.id,
    required super.title,
    required super.slug,
    required super.excerpt,
    required super.content,
    required super.status,
    required super.imageURL,
    required super.viewCount,
    required super.likeCount,
    required super.dislikeCount,
    required super.bookmarkCount,
    required super.publishDate,
    required List<UstadzModel> super.ustadz,
    required CategoryModel super.category,
    required TopicModel super.topic,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      title: map['title'],
      slug: map['slug'],
      excerpt: map['excerpt'],
      content: map['content'],
      status: map['status'],
      imageURL: map['image_url'],
      viewCount: map['view_count'],
      likeCount: map['like_count'],
      dislikeCount: map['dislike_count'],
      bookmarkCount: map['bookmark_count'],
      publishDate: map['publish_date'],
      ustadz: UstadzModel.fromMap(map['ustadzs']),
      category: CategoryModel.fromMap(map['category']),
      topic: TopicModel.fromMap(map['topic']),
    );
  }
}
