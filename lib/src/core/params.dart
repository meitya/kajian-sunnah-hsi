class NoParams {}

class TemplateParams {}

class CreateUserParams {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String gender;
  final String address;
  final String phone;

  const CreateUserParams({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.gender,
    required this.address,
    required this.phone,
  });
}

class LoginParams {
  final String email;
  final String password;
  const LoginParams({
    required this.email,
    required this.password,
  });
}
