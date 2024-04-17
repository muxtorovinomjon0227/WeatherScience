import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
class CityModel with _$CityModel {
  const factory CityModel({
    String? city,
    String? lat,
    String? lng,
    String? country,
    String? iso2,
    String? admin_name,
    String? capital,
    String? population,
    String? population_proper,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);
}
