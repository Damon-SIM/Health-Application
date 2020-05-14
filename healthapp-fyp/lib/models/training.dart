import 'package:cloud_firestore/cloud_firestore.dart';

class TrainingItemModel {
  String id;
  String desc;
  String name;
  String image;
  String mins;
  List subType = [];
  Timestamp createdAt;

  TrainingItemModel();

  TrainingItemModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    desc = data['desc'];
    name = data['name'];
    image = data['image'];
    mins = data['mins'];
    subType = data['subType'];
    createdAt = data['createdAt'];
  }
}

class BuildingItemModel {
  String id;
  String desc;
  String name;
  String image;
  String mins;
  List subType = [];
  Timestamp createdAt;

  BuildingItemModel();

  BuildingItemModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    desc = data['desc'];
    name = data['name'];
    image = data['image'];
    mins = data['mins'];
    subType = data['subType'];
    createdAt = data['createdAt'];
  }
}
