import 'package:app/domain/entities/login.dart';
import 'package:app/domain/entities/register.dart';
import 'package:app/domain/entities/user.dart';
import 'package:app/errors/login_erros.dart';
import 'package:app/injection.dart';
import 'package:app/repositories/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final repository = getIt<LoginRepository>();

  void authentication(Login login) async {
    emit(LoginLoading());
    final res = await repository.authentication(login);
    emit(res.isRight ? res.right : res.left);
  }

  void register(Register register) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 10));
    final res = await repository.register(register);
    emit(res.isRight ? res.right : res.left);
  }
}
