import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:weather_science/src/core/http/failure.dart';
import 'package:weather_science/src/features/common/data/models/remote/city/city_model.dart';
import '../../../../core/http/error_handler.dart';
import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  @override
  Future<Either<Failure, List<CityModel>>> searchCity() async {
    try {
      List<dynamic> jsonData = await loadJsonFromAssets('assets/city/uz.json');
      return Right((jsonData).map((x) => CityModel.fromJson(x)).toList());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<List> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }
}
