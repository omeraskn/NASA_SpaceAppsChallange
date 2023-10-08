import 'package:citylab/core/base/viewmodel/base_viewmodel.dart';
import 'package:citylab/product/data/algoDart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobx/mobx.dart';
import 'package:csv/csv.dart';
part 'order_stats_viewmodel.g.dart';

class OrderStatsViewModel = _OrderStatsViewModelBase with _$OrderStatsViewModel;

abstract class _OrderStatsViewModelBase extends BaseViewModel with Store {
  @observable
  var stats = ObservableList<String>.of([
    "Air Quality Index",
    "Car Crashes",
    "GDP",
    "Population Density",
    "Public Transportation",
    "Electrical Pricing",
    "Green Space Rate",
    "Health Condition",
    "Water Quality",
  ]);
  var statsIndex = List<int>.of([0, 1, 2, 3, 4, 5, 6, 7, 8]);

  @action
  void onReorder(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final items = stats.removeAt(oldIndex);
    stats.insert(newIndex, items);

    final itemsIndex = statsIndex.removeAt(oldIndex);
    statsIndex.insert(newIndex, itemsIndex);
  }

  late List<String> listData;
  @action
  void orderStates() {
    StateRanks stateRanks = StateRanks(statsIndex);
    listData = stateRanks.createTuples();
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @override
  void init() {}
}
