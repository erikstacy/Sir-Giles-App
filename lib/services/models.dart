import 'package:cloud_firestore/cloud_firestore.dart';
import 'db.dart';

class Beer {

  String id;
  Document<Beer> doc;
  String name;
  String type;
  String abbreviation;
  String abv;
  String dateCreated;
  String dateFinal;
  String dateSecondary;
  String finalGravity;
  String largeBottle;
  String notes;
  String originalGravity;
  String recipe;
  String secondaryGravity;
  String smallBottle;

  Beer({
    this.id,
    this.doc,
    this.name,
    this.type,
    this.abbreviation,
    this.abv,
    this.dateCreated,
    this.dateFinal,
    this.dateSecondary,
    this.finalGravity,
    this.largeBottle,
    this.notes,
    this.originalGravity,
    this.recipe,
    this.secondaryGravity,
    this.smallBottle,
  });

  factory Beer.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Beer(
      id: doc.documentID,
      doc: Document<Beer>(path: doc.reference.path),
      name: data['name'],
      type: data['type'],
      abbreviation: data['abbreviation'],
      abv: data['abv'],
      dateCreated: data['date_created'],
      dateFinal: data['date_final'],
      dateSecondary: data['date_secondary'],
      finalGravity: data['final_gravity'],
      largeBottle: data['large_bottle'],
      notes: data['notes'],
      originalGravity: data['original_gravity'],
      recipe: data['recipe'],
      secondaryGravity: data['secondary_gravity'],
      smallBottle: data['small_bottle'],
    );
  }
}