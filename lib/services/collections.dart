library moviestand.services.collections;

import 'dart:js';
import 'dart:convert';
import 'package:angular2/angular2.dart';

@Injectable()
class CollectionsService {
  List<Map> collections;

  CollectionsService() {
    // var loaded = JSON.decode('{"collections": []}');
    // collections = loaded['collections'] ?? [];
    // JsObject _fs = context['nodejs'].callMethod('require', ['fs']);
    JsObject _fs = context.callMethod('require', ['fs']);
    JsObject contents = _fs.callMethod('readFileSync', ['/home/josep/.moviestand/collections.db.json', 'utf8']);
    var loaded = JSON.decode(contents.toString());
    collections = loaded['collections'] ?? [];
  }
}
