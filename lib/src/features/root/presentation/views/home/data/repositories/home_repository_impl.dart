import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_science/main.dart';
import 'package:weather_science/src/core/services/hive_service.dart';
import '../../../../../../../core/consts/apis/api_endpoints.dart';
import '../../../../../../../core/http/api_service.dart';
import '../../../../../../../core/http/error_handler.dart';
import '../../../../../../../core/http/failure.dart';
import '../../../../../../../core/services/on_connectivity_changed_service.dart';
import '../../domain/repositories/home_repository.dart';
import '../models/remote/current_day/current_day_model.dart';

class HomeRepositoryImpl extends HomeRepository {
  final ApiService _apiService;
  final _key = dotenv.env['API_KEY'];
  HomeRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, CurrentDayModel>> getData({required String q,required String units}) async {
    if (await InternetService.isConnection()) {
      try {
        Response response = await _apiService.get(endPoint: "${ApiEndpoints.oneDay}?q=$q&appid=$_key&units=$units");
        HiveService.saveOneDayWeather(response.data);
        return Right(CurrentDayModel.fromJson(response.data));
      } catch (error) {
        logger.e(error);
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      Map<String, dynamic> data = await HiveService.getOneDayWeather();
      return Right(CurrentDayModel.fromJson(data));
    }
  }
}
