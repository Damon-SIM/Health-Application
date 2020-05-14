import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfo {
  String height;
  String weight;
  String documentId;

  UserInfo(
    this.height,
    this.weight,
  );

  Map<String, dynamic> toJson() => {
        'height': height,
        'weight': weight,
      };

  // creating a Trip object from a firebase snapshot
  UserInfo.fromSnapshot(DocumentSnapshot snapshot)
      : height = snapshot['height'],
        weight = snapshot['weight'],
        documentId = snapshot.documentID;
}
