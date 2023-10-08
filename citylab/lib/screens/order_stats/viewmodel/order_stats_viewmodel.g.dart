// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_stats_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderStatsViewModel on _OrderStatsViewModelBase, Store {
  late final _$statsAtom =
      Atom(name: '_OrderStatsViewModelBase.stats', context: context);

  @override
  ObservableList<String> get stats {
    _$statsAtom.reportRead();
    return super.stats;
  }

  @override
  set stats(ObservableList<String> value) {
    _$statsAtom.reportWrite(value, super.stats, () {
      super.stats = value;
    });
  }

  late final _$_OrderStatsViewModelBaseActionController =
      ActionController(name: '_OrderStatsViewModelBase', context: context);

  @override
  void onReorder(dynamic oldIndex, dynamic newIndex) {
    final _$actionInfo = _$_OrderStatsViewModelBaseActionController.startAction(
        name: '_OrderStatsViewModelBase.onReorder');
    try {
      return super.onReorder(oldIndex, newIndex);
    } finally {
      _$_OrderStatsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void orderStates() {
    final _$actionInfo = _$_OrderStatsViewModelBaseActionController.startAction(
        name: '_OrderStatsViewModelBase.orderStates');
    try {
      return super.orderStates();
    } finally {
      _$_OrderStatsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stats: ${stats}
    ''';
  }
}
