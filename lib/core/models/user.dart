import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  const User({this.id, this.phoneNumber, this.email, this.firstName, this.lastName});

  Map toJson() {
    return _$UserToJson(this);
  }

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  String getName() {
    return firstName +" "+lastName;
  }

}