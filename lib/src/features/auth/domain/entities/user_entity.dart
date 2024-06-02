import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String uuid;
  final String name;
  final String email;
  final String address;
  final String phone;
  final String gender;

  const UserEntity(
      {required this.id,
      required this.uuid,
      required this.name,
      required this.email,
      required this.address,
      required this.phone,
      required this.gender});

  @override
  List<Object?> get props => [id, uuid, name, email, gender];
}
