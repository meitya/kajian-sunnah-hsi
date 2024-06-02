import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kajian_sunnah_hsi/src/core/resources/data_state.dart';
import 'package:kajian_sunnah_hsi/src/features/home/domain/usecases/get_post_usecase.dart';

import 'package:kajian_sunnah_hsi/src/features/home/presentation/bloc/post/remote/remote_post_event.dart';
import 'package:kajian_sunnah_hsi/src/features/home/presentation/bloc/post/remote/remote_post_state.dart';

class RemotePostsBloc extends Bloc<RemotePostsEvent, RemotePostsState> {
  final GetPostsUsecase _getPostsUsecase;

  RemotePostsBloc(this._getPostsUsecase) : super(const RemotePostsLoading()) {
    on<GetPosts>(onGetPosts);
  }

  void onGetPosts(GetPosts event, Emitter<RemotePostsState> emit) async {
    final dataState = await _getPostsUsecase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemotePostsDone(posts: dataState.data!));
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemotePostsError(error: dataState.error));
    }
  }
}
