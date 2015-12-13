library moviestand.services.collections;

import 'dart:js';
import 'dart:convert';
import 'package:angular2/angular2.dart';

@Injectable()
class CollectionsService {
  // List<Map> collections;
  static CollectionsService _obj = new CollectionsService._new();
  Map _db;
  List<Collection> _list;

  factory CollectionsService() {
    return _obj;
  }

  CollectionsService._new() {
    JsObject _fs = context.callMethod('require', ['fs']);
    JsObject contents = _fs.callMethod('readFileSync',
        ['/home/josep/.moviestand/collections.db.json', 'utf8']);
    _db = JSON.decode(contents.toString()) ?? {"collections": []};
    _list = _db["collections"].map((c) => new Collection(c));
  }

  List<Collection> get list => _list;
}

class Collection {
  Map _obj;

  Collection(this._obj);

  String get id => _obj['id'];

  String get name => _obj['name'];
  void set name(String v) {
    _obj['name'] = v;
  }

  String get type => _obj['type'];
  void set type(String v) {
    _obj['type'] = v;
  }

  List get extensions => _obj['extensions'];
  List get folders => _obj['folders'];
  List get files => folders[0]['files'];
  int get count => files.length;

  List get genres {
    Map<int, Map> ret = new Map<int, Map>();

    files
      .map((f) => f['genres'])
      .fold([], (prev, element) => prev..addAll(element))
      .forEach((e) {
        if (ret.containsKey(e['id'])) {
          ret[e['id']]['count']++;
        } else {
          ret[e['id']] = {'id': e['id'], 'name': e['name'], 'count': 1};
        }
      });

    return ret.values.toList();
  }

  List get countries => _obj['production_countries'];

  // void set extensions(v) => _obj['extensions'] = v;
}
