// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfigModel _$AppConfigModelFromJson(Map<String, dynamic> json) =>
    AppConfigModel(
      maintenanceMode: json['maintenance_mode'] as bool,
      minAppVersion: json['min_app_version'] as String,
      deliveryCities: (json['delivery_cities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AppConfigModelToJson(AppConfigModel instance) =>
    <String, dynamic>{
      'maintenance_mode': instance.maintenanceMode,
      'min_app_version': instance.minAppVersion,
      'delivery_cities': instance.deliveryCities,
    };
