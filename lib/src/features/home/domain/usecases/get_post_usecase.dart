import 'package:kajian_sunnah_hsi/src/core/resources/data_state.dart';
import 'package:kajian_sunnah_hsi/src/core/usecases/usecase.dart';
import 'package:kajian_sunnah_hsi/src/features/home/domain/entities/post_entity.dart';
import 'package:kajian_sunnah_hsi/src/features/home/domain/repositories/post_repository.dart';

class GetPostsUsecase implements UseCase<DataState<List<PostEntity>>, void> {
  final PostRepository _repository;

  GetPostsUsecase(this._repository);

  @override
  Future<DataState<List<PostEntity>>> call({void params}) async {
    return await _repository.getPosts();
  }
}
