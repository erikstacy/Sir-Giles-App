import 'package:cloud_firestore/cloud_firestore.dart';
import 'db.dart';

class Beer {

  String id;
  Document<Beer> doc;
  String name;

  Beer({
    this.id,
    this.doc,
    this.name,
  });

  factory Beer.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Beer(
      id: doc.documentID,
      doc: Document<Beer>(path: doc.reference.path),
      name: data['name'],
    );
  }
}