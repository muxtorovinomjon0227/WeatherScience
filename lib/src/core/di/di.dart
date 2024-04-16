import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../enums/flavor.dart';
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
  di.registerLazySingleton<FlavorService>(() => FlavorService(flavor: flavorMode),
  );
}
