import 'package:cloud_firestore/cloud_firestore.dart';

class Trip {
  String title;
  DateTime startDate;
  DateTime endDate;
  String documentId;
 


  Trip(
      this.title,
      this.startDate,
      this.endDate,
     
      );

  Map<String, dynamic> toJson() => {
    'title': title,
    'startDate': startDate,
    'endDate': endDate,
    
  };

    // creating a Trip object from a firebase snapshot
  Trip.fromSnapshot(DocumentSnapshot snapshot) :
      title = snapshot['title'],
      startDate = snapshot['startDate'].toDate(),
      endDate = snapshot['endDate'].toDate(),
      documentId = snapshot.documentID;
     
}

