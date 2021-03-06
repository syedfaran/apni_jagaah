
import 'package:apni_jagaah/presentation/blocs/temp_bloc/temp_bloc.dart';
import 'package:apni_jagaah/source/core/api_client.dart';
import 'package:apni_jagaah/source/data_source/remote_data_source.dart';
import 'package:apni_jagaah/source/repository/json_placeholder_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'geo_location.dart';




final sl = GetIt.instance;

Future<void> init()async{
  sl.registerLazySingleton<Client>(() => Client());
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<JsonPlaceHolderRepository>(() => JsonPlaceHolderRepository(sl()));
  //sl.registerFactory<TempBloc>(() => TempBloc(sl()));
}