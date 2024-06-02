import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kajian_sunnah_hsi/src/features/home/data/datasources/remote/post_remote_datasource.dart';
import 'package:kajian_sunnah_hsi/src/features/home/data/repository/post_repository_impl.dart';
import 'package:kajian_sunnah_hsi/src/features/home/domain/repositories/post_repository.dart';
import 'package:kajian_sunnah_hsi/src/features/home/domain/usecases/get_post_usecase.dart';
import 'package:kajian_sunnah_hsi/src/features/home/presentation/bloc/post/remote/remote_post_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<PostRemoteDataSource>(PostRemoteDataSource(sl()));

  sl.registerSingleton<PostRepository>(
      PostRepositoryImpl(remoteDataSource: sl()));

  // Usecases
  sl.registerSingleton<GetPostsUsecase>(GetPostsUsecase(sl()));

  // Blocs
  sl.registerFactory<RemotePostsBloc>(() => RemotePostsBloc(sl()));
}
