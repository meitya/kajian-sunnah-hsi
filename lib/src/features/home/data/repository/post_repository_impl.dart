import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kajian_sunnah_hsi/src/core/constants/constants.dart';
import 'package:kajian_sunnah_hsi/src/features/home/data/datasources/remote/post_remote_datasource.dart';
import 'package:kajian_sunnah_hsi/src/features/home/data/models/post_model.dart';
import 'package:kajian_sunnah_hsi/src/features/home/domain/repositories/post_repository.dart';

import '../../../../core/resources/data_state.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  // final PostLocalDataSource localDataSource;
  // final NetworkInfo networkInfo;

  PostRepositoryImpl({
    required this.remoteDataSource,
    // required this.localDataSource,
    // required this.networkInfo,
  });

  @override
  Future<DataState<List<PostModel>>> getPosts() async {
    try {
      final httpResponse = await remoteDataSource.getPosts(
        categoryId: articleCategoryId,
        status: postStatus,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException.badResponse(
          statusCode: httpResponse.response.statusCode!,
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
