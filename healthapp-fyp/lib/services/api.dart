
import 'package:TMW/models/training.dart';

import 'package:TMW/services/training_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



getTraining(TrainingNotifier trainingNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance
      .collection('Training')
      .orderBy("createdAt", descending: true)
      .getDocuments();

  List<TrainingItemModel> _trainingList = [];

  snapshot.documents.forEach((document) {
    TrainingItemModel training = TrainingItemModel.fromMap(document.data);
    _trainingList.add(training);
  });

  trainingNotifier.trainingList = _trainingList;
}

getBuilding(BuildingNotifier buildingNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance
      .collection('Building')
      .orderBy("createdAt", descending: true)
      .getDocuments();

  List<BuildingItemModel> _buildingList = [];

  snapshot.documents.forEach((document) {
    BuildingItemModel building = BuildingItemModel.fromMap(document.data);
    _buildingList.add(building);
  });

  buildingNotifier.buildingList = _buildingList;
}