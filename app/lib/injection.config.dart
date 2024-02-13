// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app/bloc/cubit/login_cubit.dart' as _i5;
import 'package:app/config/api_client.dart' as _i3;
import 'package:app/domain/entities/login.dart' as _i4;
import 'package:app/domain/entities/register.dart' as _i7;
import 'package:app/repositories/login_repository.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ApiClient>(
      () => _i3.HttpApiClient(),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i4.Login>(() => _i4.Login.empty());
    gh.factory<_i5.LoginCubit>(() => _i5.LoginCubit());
    gh.factory<_i6.LoginRepository>(
        () => _i6.LoginRepository(api: gh<_i3.ApiClient>()));
    gh.factory<_i7.Register>(() => _i7.Register.empty());
    return this;
  }
}
