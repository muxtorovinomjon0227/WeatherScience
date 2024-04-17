import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../../features/root/presentation/views/calendar/data/repositories/calendar_repository_impl.dart';
import '../../features/root/presentation/views/home/data/repositories/home_repository_impl.dart';
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
  di.registerLazySingleton(() => HomeRepositoryImpl(di()));
  di.registerLazySingleton(() => CalendarRepositoryImpl(di()));
}
