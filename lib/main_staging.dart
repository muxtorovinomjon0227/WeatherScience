import 'main.dart' as app;
import 'src/core/enums/flavor.dart';

Future<void> main() async {
  await app.run(env: Flavor.STAGING);
}
