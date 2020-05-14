import 'dart:collection';

import 'package:TMW/models/training.dart';
import 'package:flutter/cupertino.dart';

class TrainingNotifier with ChangeNotifier {
  List<TrainingItemModel> _trainingList = [];
  TrainingItemModel _currentTraining;

  UnmodifiableListView<TrainingItemModel> get trainingList =>
      UnmodifiableListView(_trainingList);

  TrainingItemModel get currentTraining => _currentTraining;

  set trainingList(List<TrainingItemModel> trainingList) {
    _trainingList = trainingList;
    notifyListeners();
  }

  set currentTraining(TrainingItemModel training) {
    _currentTraining = training;
    notifyListeners();
  }
}

class BuildingNotifier with ChangeNotifier {
  List<BuildingItemModel> _buildingList = [];
  BuildingItemModel _currentBuilding;

  UnmodifiableListView<BuildingItemModel> get buildingList =>
      UnmodifiableListView(_buildingList);

  BuildingItemModel get currentBuilding => _currentBuilding;

  set buildingList(List<BuildingItemModel> buildingList) {
    _buildingList = buildingList;
    notifyListeners();
  }

  set currentBuilding(BuildingItemModel building) {
    _currentBuilding = building;
    notifyListeners();
  }
}
