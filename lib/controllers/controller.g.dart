// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on _ControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;
  Computed<bool> _$showMediaComputed;

  @override
  bool get showMedia =>
      (_$showMediaComputed ??= Computed<bool>(() => super.showMedia)).value;

  @override
  String toString() {
    final string =
        'isValid: ${isValid.toString()},showMedia: ${showMedia.toString()}';
    return '{$string}';
  }
}
