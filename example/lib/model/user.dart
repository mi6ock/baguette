import 'package:example/utils/object_id.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

class UserId extends ObjectId {
  const UserId(super.value);
}

@freezed
class User with _$User {
  const factory User({
    @Default(UserId('')) UserId id,
    String? name,
    String? email,
  }) = _User;
}
