import 'dart:convert';

void main() {
  List<String> pathList = [
    'path0',
    'path1',
    'path2',
    'path3',
    'path4',
    'path5',
    'path6',
    'path7'
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

  List<List<double>> dataList = pathList.map((path) {
    // Replace 'readCsvFunction' with the actual CSV reading function in your Dart environment.
    // Make sure it returns a List<Map<String, dynamic>> where 'Rank' is one of the keys.
    List<Map<String, dynamic>> data = readCsvFunction(path);
    return data;
  }).toList();

  List<double> multipliers = [
    1.0,
    0.9375,
    0.8750,
    0.8125,
    0.7500,
    0.6875,
    0.6250,
    0.5625
  ];

  List<int> importanceList = [1, 2, 0, 4, 3, 7, 5, 6]; // Sıralama sonucu gelenler

  List<double> statePointList = List.filled(50, 0);

  for (int i = 0; i < stateList.length; i++) {
    for (int j = 0; j < importanceList.length; j++) {
      for (Map<String, dynamic> data in dataList[j]) {
        if (data['State'] == stateList[i]) {
          statePointList[i] +=
              data['Rank'] * importanceList[j] * multipliers[j];
          break;
        }
      }
    }
  }

  List<MapEntry<String, double>> stateScoreTuples = [];
  for (int i = 0; i < stateList.length; i++) {
    stateScoreTuples.add(MapEntry(stateList[i], statePointList[i]));
  }

  stateScoreTuples.sort((a, b) => b.value.compareTo(a.value));

  List<String> sortedStates = stateScoreTuples.map((entry) => entry.key).toList();

  print(sortedStates);
}
