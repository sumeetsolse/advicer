import 'package:advicer/0_data/datasources/advice_remote_datasource.dart';
import 'package:advicer/0_data/repositories/advice_repo_impl.dart';
import 'package:advicer/1_domain/repositories/advice_repo.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:advicer/2_application/features/advice/cubit/advicer_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I;

Future<void> init() async {
  //!Application Layer
  //sl Factory = every time a new/fresh instance of that class
  sl.registerFactory(() => AdvicerCubit(adviceUsecases: sl()));
  // sl.registerLazySingleton(() => AdvicerCubit(adviceUsecases: sl())); //registerLazySingleton uses the same instance which is created before

  //!Domain Layer
  sl.registerFactory(() => AdviceUsecases(adviceRepo: sl()));

  //! Data Layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: sl()));

  //!Externs
  sl.registerFactory(() => http.Client());
}
