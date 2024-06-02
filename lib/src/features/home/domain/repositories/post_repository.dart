import 'package:kajian_sunnah_hsi/src/core/resources/data_state.dart';
import 'package:kajian_sunnah_hsi/src/features/home/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<DataState<List<PostEntity>>> getPosts();
}
