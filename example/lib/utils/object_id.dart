import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class ObjectId extends Equatable {
  @protected
  final String value;
  const ObjectId(this.value);

  @override
  List<Object> get props => [value];

  String exposeValue() => value;

  @override
  String toString() => '$runtimeType($value)';
}