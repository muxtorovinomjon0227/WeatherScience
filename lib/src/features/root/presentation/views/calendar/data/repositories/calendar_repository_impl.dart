import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_science/src/core/services/hive_service.dart';
import '../../../../../../../core/consts/apis/api_endpoints.dart';
import '../../../../../../../core/http/api_service.dart';
import '../../../../../../../core/http/error_handler.dart';
import '../../../../../../../core/http/failure.dart';
import '../../../../../../../core/services/on_connectivity_changed_service.dart';
import '../../domain/repositories/calendar_repository.dart';
import '../models/remote/month_temp/month_temp_model.dart';

class CalendarRepositoryImpl extends CalendarRepository {
  final ApiService _apiService;
  final _key = dotenv.env['API_KEY'];
  CalendarRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, MonthTempModel>> getData({required String q,required String units}) async {
    if (await InternetService.isConnection()) {
      try {
        Response response = await _apiService.get(endPoint: "${ApiEndpoints.week}?q=$q&appid=$_key&units=$units");
        HiveService.saveFiveDaysWeather(response.data);
        return Right(MonthTempModel.fromJson(response.data));
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      final data = await HiveService.getFiveDaysWeather();
      return Right(MonthTempModel.fromJson(data));
    }
  }
  }
