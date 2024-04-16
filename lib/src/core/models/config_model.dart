import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/flavor.dart';

part 'config_model.freezed.dart';

part 'config_model.g.dart';

@freezed
class ConfigModel with _$ConfigModel {
  factory ConfigModel({
    required Flavor env,
    required String apiUrl,
  }) = _ConfigModel;

  factory ConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigModelFromJson(json);
}
