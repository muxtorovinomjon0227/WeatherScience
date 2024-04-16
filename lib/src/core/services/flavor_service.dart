import '../enums/flavor.dart';
import '../environments/development/development.dart';
import '../environments/production/production.dart';
import '../environments/staging/staging.dart';
import '../environments/test/test.dart';
import '../models/config_model.dart';

class FlavorService {
  late final Flavor flavor;
  late final ConfigModel config;

  FlavorService({required this.flavor}) {
    switch (flavor) {
      case Flavor.DEV:
        config = ConfigModel.fromJson(developmentEnv);
        break;
      case Flavor.PROD:
        config = ConfigModel.fromJson(productionEnv);
        break;
      case Flavor.TEST:
        config = ConfigModel.fromJson(testEnv);
        break;
      case Flavor.STAGING:
        config = ConfigModel.fromJson(stagingEnv);
        break;
    }
  }

  bool get isDevelopment => flavor == Flavor.DEV;

  bool get isProduction => flavor == Flavor.PROD;
}
