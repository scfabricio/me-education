import 'package:app/bloc/cubit/login_cubit.dart';
import 'package:app/config/api_client.dart';
import 'package:app/domain/entities/login.dart';
import 'package:app/domain/entities/register.dart';
import 'package:app/domain/entities/user.dart';
import 'package:app/errors/login_erros.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginRepository {
  final ApiClient api;

  LoginRepository({ required this.api });

  Future<Either<LoginError, LoginState>> authentication(Login login) async {
    try {
      final result = await api.post('/authentication', login.toJson());

      if (result.statusCode == 200) {
        User user = User.fromJson(result.body);
        return Right(LoginSuccess(user));
      }

      return Left(LoginError(UnauthorizedLoginFailure()));
    } catch (e) {
      return Left(LoginError(GenericLoginFailure()));
    }
  }

  Future<Either<LoginError, LoginState>> register(Register register) async {
    try {
      final result = await api.post('/register', register.toJson());

      if (result.statusCode == 200) {
        return const Right(SignUpSuccess());
      }

      return Left(LoginError(EmailRegisteredFailure()));
    } catch (e) {
      return Left(LoginError(GenericLoginFailure()));
    }
  }

  // Future<dynamic> refreshtoken() {}

  // Future<dynamic> forgotPassword() {}
}