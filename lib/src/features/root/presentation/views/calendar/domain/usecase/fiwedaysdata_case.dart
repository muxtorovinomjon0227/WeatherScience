import 'package:dartz/dartz.dart';
import '../../../../../../../core/http/failure.dart';
import '../../data/models/remote/month_temp/month_temp_model.dart';
import '../repositories/calendar_repository.dart';



abstract class FiveDaysDataCase {
  Future<Either<Failure, MonthTempModel>> execute(String q,String units);
}

class FiveDaysDataUseCase extends FiveDaysDataCase {
  final CalendarRepository _calendarRepository;
  FiveDaysDataUseCase(this._calendarRepository);

  @override
  Future<Either<Failure, MonthTempModel>> execute(q,units) async {
    return await _calendarRepository.getData(q: q,units: units);
  }
}