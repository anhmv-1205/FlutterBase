// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../data/model/mapper/error_response_detail_mappper.dart' as _i3;
import '../data/model/mapper/error_response_mapper.dart' as _i4;
import '../data/model/mapper/user_data_mapper.dart' as _i8;
import '../data/repository/repository_impl.dart' as _i15;
import '../data/source/local/local_data_source.dart' as _i12;
import '../data/source/local/preference/app_preferences.dart' as _i11;
import '../data/source/local/preference/model/mapper/user_preference_mapper.dart'
    as _i9;
import '../data/source/remote/api/error/http_request_exception_mapper.dart'
    as _i5;
import '../data/source/remote/api/services/refresh_token_service.dart' as _i6;
import '../data/source/remote/api/services/user_service.dart' as _i10;
import '../data/source/remote/remote_data_source.dart' as _i13;
import '../domain/repository/app_repository.dart' as _i14;
import '../domain/usecases/login_use_case.dart' as _i16;
import '../ui/pages/login/login_bloc.dart' as _i17;
import 'local_module.dart' as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.factory<_i3.ErrorResponseDetailMapper>(
      () => _i3.ErrorResponseDetailMapper());
  gh.factory<_i4.ErrorResponseMapper>(
      () => _i4.ErrorResponseMapper(get<_i3.ErrorResponseDetailMapper>()));
  gh.factory<_i5.HttpRequestExceptionMapper>(
      () => _i5.HttpRequestExceptionMapper(get<_i4.ErrorResponseMapper>()));
  gh.lazySingleton<_i6.RefreshTokenService>(() => _i6.RefreshTokenService());
  await gh.factoryAsync<_i7.SharedPreferences>(() => injectableModule.prefs,
      preResolve: true);
  gh.factory<_i8.UserDataMapper>(() => _i8.UserDataMapper());
  gh.factory<_i9.UserPreferenceMapper>(() => _i9.UserPreferenceMapper());
  gh.lazySingleton<_i10.UserService>(() => _i10.UserService());
  gh.lazySingleton<_i11.AppPreferences>(
      () => _i11.AppPreferences(get<_i7.SharedPreferences>()));
  gh.lazySingleton<_i12.LocalDataSource>(
      () => _i12.LocalDataSource(get<_i11.AppPreferences>()));
  gh.lazySingleton<_i13.RemoteDataSource>(() => _i13.RemoteDataSource(
      get<_i10.UserService>(), get<_i8.UserDataMapper>()));
  gh.lazySingleton<_i14.AppRepository>(() => _i15.RepositoryImpl(
      get<_i12.LocalDataSource>(), get<_i13.RemoteDataSource>()));
  gh.factory<_i16.LoginUseCase>(
      () => _i16.LoginUseCase(get<_i14.AppRepository>()));
  gh.factory<_i17.LoginBloc>(() => _i17.LoginBloc(get<_i16.LoginUseCase>()));
  return get;
}

class _$InjectableModule extends _i18.InjectableModule {}
