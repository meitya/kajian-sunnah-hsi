import 'package:kajian_sunnah_hsi/src/features/auth/domain/entities/user_entity.dart';

import '../../domain/entities/auth_entity.dart';
import 'user_model.dart';

class AuthModel extends AuthEntity {
  const AuthModel({required super.token, required UserModel super.user});

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      token: map['token'],
      user: UserModel.fromMap(map['user']),
    );
  }
}
