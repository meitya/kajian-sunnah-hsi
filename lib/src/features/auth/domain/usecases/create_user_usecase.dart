import 'package:kajian_sunnah_hsi/src/core/params.dart';
import 'package:kajian_sunnah_hsi/src/core/resources/data_state.dart';
import 'package:kajian_sunnah_hsi/src/core/usecases/usecase.dart';
import 'package:kajian_sunnah_hsi/src/features/auth/domain/repositories/auth_repository.dart';

class CreateUserUsecase implements UseCase<DataState<void>, CreateUserParams> {
  final AuthRepository _repository;

  CreateUserUsecase(this._repository);

  @override
  Future<DataState<void>> call({CreateUserParams? params}) async {
    return await _repository.createUser(
      email: params!.email,
      password: params.password,
      passwordConfirmation: params.password,
      gender: params.gender,
      address: params.address,
      phone: params.phone,
    );
  }
}
