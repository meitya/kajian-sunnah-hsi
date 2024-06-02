class UstadzEntity {
  final int id;
  final String name;

  const UstadzEntity({
    required this.id,
    required this.name,
  });
}

class CategoryEntity {
  final int id;
  final String uuid;
  final String name;
  final String slug;

  const CategoryEntity({
    required this.id,
    required this.uuid,
    required this.name,
    required this.slug,
  });
}

class TopicEntity {
  final int id;
  final String uuid;
  final String name;
  final String slug;

  const TopicEntity({
    required this.id,
    required this.uuid,
    required this.name,
    required this.slug,
  });
}
