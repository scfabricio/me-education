import 'package:app/domain/vos/email.dart';
import 'package:app/domain/vos/name.dart';
import 'package:app/domain/vos/password.dart';
import 'package:injectable/injectable.dart';

@injectable
class Register {
  Name _name;
  Email _email;
  Password _password;
  Password _confirmPassword;

  Name get name => _name;
  void setName(String? value) => _name = Name(value ?? '');

  Email get email => _email;
  void setEmail(String? value) => _email = Email(value ?? '');

  Password get password => _password;
  void setPassword(String? value) => _password = Password(value ?? '');

  Password get confirmPassword => _confirmPassword;
  void setConfirmPassword(String? value) =>
      _confirmPassword = Password(value ?? '');

  Register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  })  : _name = Name(name),
        _email = Email(email),
        _password = Password(password),
        _confirmPassword = Password(confirmPassword);

  @factoryMethod
  factory Register.empty() {
    return Register(
      name: '',
      email: '',
      password: '',
      confirmPassword: '',
    );
  }

  static Register fromJson(dynamic data) {
    return Register(
      name: data['name'],
      email: data['email'],
      password: data['password'],
      confirmPassword: data['confirmePassword'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': _name,
      'email': _email,
      'password': _password,
      'confirm': _confirmPassword,
    };
  }
}
