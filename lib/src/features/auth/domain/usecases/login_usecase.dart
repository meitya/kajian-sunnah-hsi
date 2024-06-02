import 'package:kajian_sunnah_hsi/src/core/params.dart';
import 'package:kajian_sunnah_hsi/src/core/resources/data_state.dart';
import 'package:kajian_sunnah_hsi/src/core/usecases/usecase.dart';
import 'package:kajian_sunnah_hsi/src/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase implements UseCase<DataState<void>, LoginParams> {
  final AuthRepository _repository;

  LoginUsecase(this._repository);

  @override
  Future<DataState<void>> call({LoginParams? params}) async {
    return await _repository.login(
        email: params!.email, password: params.password);
  }
}
