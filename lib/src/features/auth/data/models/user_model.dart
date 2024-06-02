import 'package:kajian_sunnah_hsi/src/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.id,
      required super.uuid,
      required super.name,
      required super.email,
      required super.address,
      required super.phone,
      required super.gender});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      uuid: map['uuid'],
      name: map['name'],
      email: map['email'],
      address: map['address'],
      phone: map['phone'],
      gender: map['gender'],
    );
  }
}
