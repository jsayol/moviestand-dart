library moviestand.filters;

import 'package:angular2/angular2.dart' show Injectable;

@Injectable()
class FilterFactory {
  static FilterFactory _obj = new FilterFactory._new();

  var genre;
  var country;
  String query = '';
  bool hideWatched = true;

  factory FilterFactory() => _obj;
  FilterFactory._new();
}
