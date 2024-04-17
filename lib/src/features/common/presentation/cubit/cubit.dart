import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_science/src/features/common/data/models/remote/city/city_model.dart';
import '../../data/repositories/search_repository_impl.dart';

class CitySearchCubit extends Cubit<List<CityModel>>{
  List<CityModel> listModel = [];
  CitySearchCubit(): super([]);

  Future<void> fetchData() async {
    await SearchRepositoryImpl().searchCity().then((value) => value.fold((l) => listModel = [],
            (r) { listModel = r;emit(r);}));
  }
  Future<void> searchData(String value) async {
    List<CityModel> list = listModel.where((food) => food.city!.toLowerCase().contains(value.toLowerCase())).toList();
    emit(list);}
}