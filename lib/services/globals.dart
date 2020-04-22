import 'db.dart';
import 'models.dart';

class Global {

  static final Map models = {
    Beer: (data) => Beer.fromFirestore(data),
  };

  static final Collection<Beer> beerCollection = Collection<Beer>(path: 'beers');

}