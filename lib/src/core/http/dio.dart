import 'package:dio/dio.dart';

import '../di/di.dart';
import '../services/flavor_service.dart';
import 'dio_flutter_transformer.dart';

final options = BaseOptions(
  baseUrl: di<FlavorService>().config.apiUrl,
  connectTimeout: const Duration(milliseconds: 240000),
  receiveTimeout: const Duration(milliseconds: 240000),
);

final dio = Dio(options)..transformer = FlutterTransformer();

