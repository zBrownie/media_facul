// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormState on _FormStateBase, Store {
  Computed<double> _$notasComputed;

  @override
  double get notas =>
      (_$notasComputed ??= Computed<double>(() => super.notas)).value;

  final _$nomeMateriaAtom = Atom(name: '_FormStateBase.nomeMateria');

  @override
  String get nomeMateria {
    _$nomeMateriaAtom.context.enforceReadPolicy(_$nomeMateriaAtom);
    _$nomeMateriaAtom.reportObserved();
    return super.nomeMateria;
  }

  @override
  set nomeMateria(String value) {
    _$nomeMateriaAtom.context.conditionallyRunInAction(() {
      super.nomeMateria = value;
      _$nomeMateriaAtom.reportChanged();
    }, _$nomeMateriaAtom, name: '${_$nomeMateriaAtom.name}_set');
  }

  final _$nota1Atom = Atom(name: '_FormStateBase.nota1');

  @override
  String get nota1 {
    _$nota1Atom.context.enforceReadPolicy(_$nota1Atom);
    _$nota1Atom.reportObserved();
    return super.nota1;
  }

  @override
  set nota1(String value) {
    _$nota1Atom.context.conditionallyRunInAction(() {
      super.nota1 = value;
      _$nota1Atom.reportChanged();
    }, _$nota1Atom, name: '${_$nota1Atom.name}_set');
  }

  final _$nota2Atom = Atom(name: '_FormStateBase.nota2');

  @override
  String get nota2 {
    _$nota2Atom.context.enforceReadPolicy(_$nota2Atom);
    _$nota2Atom.reportObserved();
    return super.nota2;
  }

  @override
  set nota2(String value) {
    _$nota2Atom.context.conditionallyRunInAction(() {
      super.nota2 = value;
      _$nota2Atom.reportChanged();
    }, _$nota2Atom, name: '${_$nota2Atom.name}_set');
  }

  final _$nota3Atom = Atom(name: '_FormStateBase.nota3');

  @override
  String get nota3 {
    _$nota3Atom.context.enforceReadPolicy(_$nota3Atom);
    _$nota3Atom.reportObserved();
    return super.nota3;
  }

  @override
  set nota3(String value) {
    _$nota3Atom.context.conditionallyRunInAction(() {
      super.nota3 = value;
      _$nota3Atom.reportChanged();
    }, _$nota3Atom, name: '${_$nota3Atom.name}_set');
  }

  final _$nota4Atom = Atom(name: '_FormStateBase.nota4');

  @override
  String get nota4 {
    _$nota4Atom.context.enforceReadPolicy(_$nota4Atom);
    _$nota4Atom.reportObserved();
    return super.nota4;
  }

  @override
  set nota4(String value) {
    _$nota4Atom.context.conditionallyRunInAction(() {
      super.nota4 = value;
      _$nota4Atom.reportChanged();
    }, _$nota4Atom, name: '${_$nota4Atom.name}_set');
  }

  final _$_FormStateBaseActionController =
      ActionController(name: '_FormStateBase');

  @override
  dynamic changeNomeMateria(String newValue) {
    final _$actionInfo = _$_FormStateBaseActionController.startAction();
    try {
      return super.changeNomeMateria(newValue);
    } finally {
      _$_FormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNota1(String newValue) {
    final _$actionInfo = _$_FormStateBaseActionController.startAction();
    try {
      return super.changeNota1(newValue);
    } finally {
      _$_FormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNota2(String newValue) {
    final _$actionInfo = _$_FormStateBaseActionController.startAction();
    try {
      return super.changeNota2(newValue);
    } finally {
      _$_FormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNota3(String newValue) {
    final _$actionInfo = _$_FormStateBaseActionController.startAction();
    try {
      return super.changeNota3(newValue);
    } finally {
      _$_FormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNota4(String newValue) {
    final _$actionInfo = _$_FormStateBaseActionController.startAction();
    try {
      return super.changeNota4(newValue);
    } finally {
      _$_FormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'nomeMateria: ${nomeMateria.toString()},nota1: ${nota1.toString()},nota2: ${nota2.toString()},nota3: ${nota3.toString()},nota4: ${nota4.toString()},notas: ${notas.toString()}';
    return '{$string}';
  }
}
