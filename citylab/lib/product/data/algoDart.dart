import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class StateRanks {
  List<int> importanceList;
  StateRanks(this.importanceList);

  List<String> pathList = [
    "assets/data/rank/aqi_rank.csv",
    "assets/data/rank/crashes_rank.csv",
    "assets/data/rank/death_rate_rank.csv",
    "assets/data/rank/density_rank.csv",
    "assets/data/rank/drug_death_rank.csv",
    "assets/data/rank/electrical_pricing_rank.csv",
    "assets/data/rank/greenspace_rank.csv",
    "assets/data/rank/healthiest_rank.csv",
    "assets/data/rank/water_quality_rank.csv",
  ];

  List<String> stateList = [
    'Alabama',
    'Arkansas',
    'Arizona',
    'California',
    'Colorado',
    'Connecticut',
    'District of Columbia',
    'Delaware',
    'Florida',
    'Georgia',
    'Iowa',
    'Idaho',
    'Illinois',
    'Indiana',
    'Kansas',
    'Kentucky',
    'Louisiana',
    'Massachusetts',
    'Maryland',
    'Maine',
    'Michigan',
    'Minnesota',
    'Missouri',
    'Mississippi',
    'Montana',
    'North Carolina',
    'North Dakota',
    'Nebraska',
    'New Hampshire',
    'New Jersey',
    'New Mexico',
    'Nevada',
    'New York',
    'Ohio',
    'Oklahoma',
    'Oregon',
    'Pennsylvania',
    'Rhode Island',
    'South Carolina',
    'South Dakota',
    'Tennessee',
    'Texas',
    'Utah',
    'Virginia',
    'Vermont',
    'Washington',
    'Wisconsin',
    'West Virginia',
    'Wyoming'
  ];

  List<Map<String, dynamic>> loadCSV(String path) {
    List<Map<String, dynamic>> csvData = [];
    final rawData = rootBundle.loadString(path).toString();
    final List<List<dynamic>> csvList =
        const CsvToListConverter().convert(rawData);

    if (csvList.isNotEmpty) {
      final headers = csvList[0].cast<String>();
      for (var i = 1; i < csvList.length; i++) {
        final row = csvList[i].cast<dynamic>();
        final rowMap = Map<String, dynamic>();
        for (var j = 0; j < headers.length; j++) {
          rowMap[headers[j]] = row[j];
        }
        csvData.add(rowMap);
      }
    }
    return csvData;
  }

  List<List<Map<String, dynamic>>> fillDataList() {
    List<List<Map<String, dynamic>>> dataList = [];
    for (var path in pathList) {
      dataList.add(loadCSV(path));
    }
    return dataList;
  }

  List<double> multipliers = [
    1.0,
    0.9375,
    0.8750,
    0.8125,
    0.7500,
    0.6875,
    0.6250,
    0.5625,
    0.5
  ];

  List<double> createPoints() {
    List<List<Map<String, dynamic>>> dataList = fillDataList();
    List<double> statePointList = List.filled(51, 0);
    for (int i = 0; i < stateList.length; i++) {
      for (int j = 0; j < importanceList.length; j++) {
        if (dataList[i][j]['State'] == stateList[i]) {
          statePointList[i] +=
              dataList[i][j]['Rank'] * importanceList[j] * multipliers[j];
        }
      }
    }
    print(statePointList);
    return statePointList;
  }

  List<MapEntry<String, double>> stateScoreTuples = [];
  List<String> createTuples() {
    List<double> statePointList = createPoints();
    for (int i = 0; i < stateList.length; i++) {
      stateScoreTuples.add(MapEntry(stateList[i], statePointList[i]));
    }

    stateScoreTuples.sort((a, b) => b.value.compareTo(a.value));

    return stateScoreTuples.map((entry) => entry.key).toList();
  }
}
