import 'package:dartz/dartz.dart';
import '../../../../../../../core/http/failure.dart';
import '../../data/models/remote/current_day/current_day_model.dart';
import '../repositories/home_repository.dart';


abstract class CurrentDayDataCase {
  Future<Either<Failure, CurrentDayModel>> execute(String q,String units);
}

class CurrentDayDataUseCase extends CurrentDayDataCase {
  final HomeRepository _homeRepository;
  CurrentDayDataUseCase(this._homeRepository);

  @override
  Future<Either<Failure, CurrentDayModel>> execute(q,units) async {
    return await _homeRepository.getData(q: q,units: units);
  }
}