import 'package:app/domain/vos/email.dart';
import 'package:app/domain/vos/password.dart';
import 'package:injectable/injectable.dart';

@injectable
class Login {
  Email _email;
  Password _password;

  Email get email => _email;
  void setEmail(String? value) => _email = Email(value ?? '');

  Password get password => _password;
  void setPassword(String? value) => _password = Password(value ?? '');

  Login({
    required String email,
    required String password,
  })  : _email = Email(email),
        _password = Password(password);

  @factoryMethod
  factory Login.empty() {
    return Login(email: '', password: '');
  }

  static Login fromJson(dynamic data) {
    return Login(email: data['email'], password: data['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': _email,
      'password': _password,
    };
  }
}
