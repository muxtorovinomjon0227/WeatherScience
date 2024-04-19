import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecase/signin_emailpass_usecase.dart';
import '../../features/auth/domain/usecase/signin_with_google_case.dart';
import '../../features/auth/domain/usecase/signup_emailpass_usecase.dart';
import '../../features/root/presentation/views/calendar/data/repositories/calendar_repository_impl.dart';
import '../../features/root/presentation/views/calendar/domain/repositories/calendar_repository.dart';
import '../../features/root/presentation/views/calendar/domain/usecase/fiwedaysdata_case.dart';
import '../../features/root/presentation/views/home/data/repositories/home_repository_impl.dart';
import '../../features/root/presentation/views/home/domain/repositories/home_repository.dart';
import '../../features/root/presentation/views/home/domain/usecase/currentdaydata_case.dart';
import '../enums/flavor.dart';
import '../http/api_service.dart';
import '../services/flavor_service.dart';
import 'di.config.dart';

final di = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies(Flavor flavorMode,) async {
  $initGetIt(di);
  di.registerLazySingleton<FlavorService>(() => FlavorService(flavor: flavorMode));

  di.registerLazySingleton(() => ApiService());

  di.registerLazySingleton(() => AuthRepositoryImpl(di()));
  di.registerFactory<AuthRepository>(() => AuthRepositoryImpl(di()));

  di.registerLazySingleton(() => HomeRepositoryImpl(di()));
  di.registerFactory<HomeRepository>(() => HomeRepositoryImpl(di()));

  di.registerLazySingleton(() => CalendarRepositoryImpl(di()));
  di.registerFactory<CalendarRepository>(() => CalendarRepositoryImpl(di()));


  /// UseCase
  di.registerFactory<GoogleAuthUseCase>(() => GoogleAuthUseCase(di()));
  di.registerFactory<EmailPassUseCase>(() => EmailPassUseCase(di()));
  di.registerFactory<EmailPassSignInUseCase>(() => EmailPassSignInUseCase(di()));
  di.registerFactory<CurrentDayDataUseCase>(() => CurrentDayDataUseCase(di()));
  di.registerFactory<FiveDaysDataUseCase>(() => FiveDaysDataUseCase(di()));
}
