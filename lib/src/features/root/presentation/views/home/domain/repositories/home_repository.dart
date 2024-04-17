import 'package:dartz/dartz.dart';
import '../../../../../../../core/http/failure.dart';
import '../../data/models/remote/current_day/current_day_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, CurrentDayModel>> getData({required String q,required String units});
}
