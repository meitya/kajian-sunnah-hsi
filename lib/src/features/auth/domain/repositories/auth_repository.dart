import 'package:kajian_sunnah_hsi/src/core/resources/data_state.dart';
import 'package:kajian_sunnah_hsi/src/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<DataState<void>> createUser(
      {required String name,
      required String email,
      required String password,
      required String passwordConfirmation,
      required String gender,
      required String address,
      required String phone});

  Future<DataState<AuthEntity>> login(
      {required String email, required String password});
}
