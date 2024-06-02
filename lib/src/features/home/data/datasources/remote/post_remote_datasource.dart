import 'package:dio/dio.dart';
import 'package:kajian_sunnah_hsi/src/core/constants/constants.dart';
import 'package:kajian_sunnah_hsi/src/features/home/data/models/post_model.dart';
import 'package:retrofit/retrofit.dart';

part 'post_remote_datasource.g.dart';

@RestApi(baseUrl: baseURL)
abstract class PostRemoteDataSource {
  factory PostRemoteDataSource(Dio dio) = _PostRemoteDataSource;

  @GET('/posts')
  Future<HttpResponse<List<PostModel>>> getPosts({
    @Query('filter[category_id]') int categoryId,
    @Query('filter[status]') String status,
  });
}

// class PostRemoteDataSourceImpl implements PostRemoteDataSource {
//   PostRemoteDataSourceImpl({required this.dio});

//   @override
//   Future<List<PostModel>> getPosts() async {
//     final response = await dio.get(
//         'https://stackovercode.my.id/api/v1/posts?filter[category_id]=2&filter[status]=published');

//     if (response.statusCode == 200) {
//       final articles = response.data['result']['posts'] as List;
//       return articles.map((post) => PostModel.fromMap(post)).toList();
//     } else {}
//   }
// }
