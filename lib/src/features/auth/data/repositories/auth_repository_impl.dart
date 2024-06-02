import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kajian_sunnah_hsi/src/features/auth/domain/entities/auth_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  // final AuthLocalDataSource localDataSource;
  // final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    // required this.localDataSource,
    // required this.networkInfo,
  });

  @override
  Future<DataState<void>> createUser(
      {required String name,
      required String email,
      required String password,
      required String passwordConfirmation,
      required String gender,
      required String address,
      required String phone}) async {
    try {
      final httpResponse = await remoteDataSource.createUser(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
        gender: gender,
        address: address,
        phone: phone,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(null);
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

  @override
  Future<DataState<AuthEntity>> login(
      {required String email, required String password}) async {
    try {
      final httpResponse =
          await remoteDataSource.login(email: email, password: password);

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
