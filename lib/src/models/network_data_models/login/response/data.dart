import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String name;
  int id;
  String email;
  String gender;
  String region;
  String contact1;
  String contact2;
  String contact3;
  String contact4;
  String contact5;
  DateTime dob;
  String type;

  Data({
    this.name,
    this.id,
    this.email,
    this.gender,
    this.region,
    this.contact1,
    this.contact2,
    this.contact3,
    this.contact4,
    this.contact5,
    this.dob,
    this.type,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
