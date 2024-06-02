import 'package:dio/dio.dart';
import 'package:kajian_sunnah_hsi/src/core/constants/constants.dart';
import 'package:kajian_sunnah_hsi/src/features/auth/data/models/auth_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_remote_datasource.g.dart';

@RestApi(baseUrl: baseURL)
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;

  @POST('/auth/register')
  Future<HttpResponse<void>> createUser({
    @Field('name') String name,
    @Field('email') String email,
    @Field('password') String password,
    @Field('password_confirmation') String passwordConfirmation,
    @Field('gender') String gender,
    @Field('address') String address,
    @Field('phone') String phone,
  });

  @POST('/auth/login')
  Future<HttpResponse<AuthModel>> login(
      {@Field('email') String email, @Field('password') String password});
}
