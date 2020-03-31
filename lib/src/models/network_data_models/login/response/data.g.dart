// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    name: json['name'] as String,
    id: json['id'] as int,
    email: json['email'] as String,
    gender: json['gender'] as String,
    region: json['region'] as String,
    contact1: json['contact1'] as String,
    contact2: json['contact2'] as String,
    contact3: json['contact3'] as String,
    contact4: json['contact4'] as String,
    contact5: json['contact5'] as String,
    dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'email': instance.email,
      'gender': instance.gender,
      'region': instance.region,
      'contact1': instance.contact1,
      'contact2': instance.contact2,
      'contact3': instance.contact3,
      'contact4': instance.contact4,
      'contact5': instance.contact5,
      'dob': instance.dob?.toIso8601String(),
      'type': instance.type,
    };
