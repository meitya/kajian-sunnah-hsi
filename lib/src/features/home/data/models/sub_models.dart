import 'package:kajian_sunnah_hsi/src/features/home/domain/entities/sub_entities.dart';

class UstadzModel extends UstadzEntity {
  const UstadzModel({
    required super.id,
    required super.name,
  });

  static List<UstadzModel> fromMap(List<dynamic> mapList) {
    List<UstadzModel> ustadzs = [];
    for (Map<String, dynamic> map in mapList) {
      ustadzs.add(UstadzModel(
        id: map['id'],
        name: map['name'],
      ));
    }
    return ustadzs;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.uuid,
    required super.name,
    required super.slug,
  });

  static CategoryModel fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      uuid: map['uuid'],
      name: map['name'],
      slug: map['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'name': name,
      'slug': slug,
    };
  }
}

class TopicModel extends TopicEntity {
  const TopicModel({
    required super.id,
    required super.uuid,
    required super.name,
    required super.slug,
  });

  static TopicModel fromMap(Map<String, dynamic> map) {
    return TopicModel(
      id: map['id'],
      uuid: map['uuid'],
      name: map['name'],
      slug: map['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'name': name,
      'slug': slug,
    };
  }
}
