import 'package:json_annotation/json_annotation.dart';

part 'app_config_model.g.dart';

@JsonSerializable()
class AppConfigModel {
  AppConfigModel({
    required this.maintenanceMode,
    required this.minAppVersion,
    required this.deliveryCities,
  });

  factory AppConfigModel.fromJson(Map<String, dynamic> json) => _$AppConfigModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppConfigModelToJson(this);

  @JsonKey(name: 'maintenance_mode')
  final bool maintenanceMode;

  @JsonKey(name: 'min_app_version')
  final String minAppVersion;

  @JsonKey(name: 'delivery_cities')
  final List<String> deliveryCities;
}