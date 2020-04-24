import 'package:cloud_firestore/cloud_firestore.dart';
import 'db.dart';

class Beer {

  String id;
  Document<Beer> doc;
  String name;
  String type;
  String abbreviation;

  Beer({
    this.id,
    this.doc,
    this.name,
    this.type,
    this.abbreviation,
  });

  factory Beer.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Beer(
      id: doc.documentID,
      doc: Document<Beer>(path: doc.reference.path),
      name: data['name'],
      type: data['type'],
      abbreviation: data['abbreviation'],
    );
  }
}