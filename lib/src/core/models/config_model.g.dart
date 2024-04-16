// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigModelImpl _$$ConfigModelImplFromJson(Map<String, dynamic> json) =>
    _$ConfigModelImpl(
      env: $enumDecode(_$FlavorEnumMap, json['env']),
      apiUrl: json['apiUrl'] as String,
    );

Map<String, dynamic> _$$ConfigModelImplToJson(_$ConfigModelImpl instance) =>
    <String, dynamic>{
      'env': _$FlavorEnumMap[instance.env]!,
      'apiUrl': instance.apiUrl,
    };

const _$FlavorEnumMap = {
  Flavor.DEV: 'DEV',
  Flavor.PROD: 'PROD',
  Flavor.TEST: 'TEST',
  Flavor.STAGING: 'STAGING',
};
