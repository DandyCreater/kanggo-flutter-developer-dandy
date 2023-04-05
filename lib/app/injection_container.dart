import 'package:get_it/get_it.dart';
import 'package:kanggo_flutter_developer_dandy/data/datasource/remote_data_source.dart';
import 'package:kanggo_flutter_developer_dandy/data/repository/data_repository.dart';
import 'package:kanggo_flutter_developer_dandy/domain/repository/domain_repository.dart';
import 'package:kanggo_flutter_developer_dandy/domain/usecase/user_usecase.dart';
import 'package:kanggo_flutter_developer_dandy/presentation/bloc/user-bloc/user_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => UserBloc(sl()));

  sl.registerLazySingleton(() => UserUseCase(sl()));

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  sl.registerLazySingleton<DomainRepository>(
      () => DataRepository(remoteDataSource: sl()));
}
