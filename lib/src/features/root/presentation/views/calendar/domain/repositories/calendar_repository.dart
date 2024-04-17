import 'package:dartz/dartz.dart';
import '../../../../../../../core/http/failure.dart';
import '../../data/models/remote/month_temp/month_temp_model.dart';

abstract class CalendarRepository {
  Future<Either<Failure, MonthTempModel>> getData({required String q,required String units});
}
