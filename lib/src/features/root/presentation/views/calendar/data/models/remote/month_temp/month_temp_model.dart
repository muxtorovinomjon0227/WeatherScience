import 'package:freezed_annotation/freezed_annotation.dart';

part 'month_temp_model.freezed.dart';
part 'month_temp_model.g.dart';


@freezed
class MonthTempModel with _$MonthTempModel {
  const factory MonthTempModel({
    String? cod,
    int? message,
    int? cnt,
    List<ListElement>? list,
    City? city,
  }) = _MonthTempModel;

  factory MonthTempModel.fromJson(Map<String, dynamic> json) => _$MonthTempModelFromJson(json);
}

@freezed
class City with _$City {
  const factory City({
    int? id,
    String? name,
    Coord? coord,
    String? country,
    int? population,
    int? timezone,
    int? sunrise,
    int? sunset,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@freezed
class Coord with _$Coord {
  const factory Coord({
    double? lat,
    double? lon,
  }) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@freezed
class ListElement with _$ListElement {
  const factory ListElement({
    int? dt,
    Main? main,
    List<Weather>? weather,
    Clouds? clouds,
    Wind? wind,
    int? visibility,
    double? pop,
    Sys? sys,
    String? dt_txt,
  }) = _ListElement;

  factory ListElement.fromJson(Map<String, dynamic> json) => _$ListElementFromJson(json);
}

@freezed
class Clouds with _$Clouds {
  const factory Clouds({
    int? all,
  }) = _Clouds;

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@freezed
class Main with _$Main {
  const factory Main({
    double? temp,
    double? feels_like,
    double? temp_min,
    double? temp_max,
    int? pressure,
    int? sea_level,
    int? grnd_level,
    int? humidity,
    double? temp_kf,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
class Sys with _$Sys {
  const factory Sys({
    String? pod,
  }) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@freezed
class Weather with _$Weather {
  const factory Weather({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

@freezed
class Wind with _$Wind {
  const factory Wind({
    double? speed,
    int? deg,
    double? gust,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
