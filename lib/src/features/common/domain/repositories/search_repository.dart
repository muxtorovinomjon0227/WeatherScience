import 'package:dartz/dartz.dart';
import '../../../../core/http/failure.dart';
import '../../data/models/remote/city/city_model.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<CityModel>>> searchCity();
  Future<List<dynamic>> loadJsonFromAssets(String filePath);
}
