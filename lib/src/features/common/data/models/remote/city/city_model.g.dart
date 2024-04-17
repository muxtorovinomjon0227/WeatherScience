// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityModelImpl _$$CityModelImplFromJson(Map<String, dynamic> json) =>
    _$CityModelImpl(
      city: json['city'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      country: json['country'] as String?,
      iso2: json['iso2'] as String?,
      admin_name: json['admin_name'] as String?,
      capital: json['capital'] as String?,
      population: json['population'] as String?,
      population_proper: json['population_proper'] as String?,
    );

Map<String, dynamic> _$$CityModelImplToJson(_$CityModelImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'lat': instance.lat,
      'lng': instance.lng,
      'country': instance.country,
      'iso2': instance.iso2,
      'admin_name': instance.admin_name,
      'capital': instance.capital,
      'population': instance.population,
      'population_proper': instance.population_proper,
    };
