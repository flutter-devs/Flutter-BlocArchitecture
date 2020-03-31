import 'package:flutter_bloc_architecture/src/models/network_data_models/login/response/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  String accessToken;
  String tokenType;
  int expiresIn;
  Data data;

  Result({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.data,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
