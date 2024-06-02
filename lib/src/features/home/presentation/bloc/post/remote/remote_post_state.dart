import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:kajian_sunnah_hsi/src/features/home/domain/entities/post_entity.dart';

abstract class RemotePostsState extends Equatable {
  final List<PostEntity>? posts;
  final DioException? error;

  const RemotePostsState({this.posts, this.error});

  @override
  List<Object> get props => [posts!, error!];
}

class RemotePostsLoading extends RemotePostsState {
  const RemotePostsLoading();
}

class RemotePostsDone extends RemotePostsState {
  const RemotePostsDone({super.posts});
}

class RemotePostsError extends RemotePostsState {
  const RemotePostsError({super.error});
}
