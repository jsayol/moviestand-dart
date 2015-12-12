// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library moviestand.settings.collections;

import 'package:angular2/angular2.dart'
    show Component, NgFor, NgClass, NgIf, NgModel;
import 'package:moviestand/services/collections.dart';
import 'package:moviestand/electron/electron.dart';

@Component(
    selector: 'ms-settings-collections',
    templateUrl: 'settings.collections.html',
    viewProviders: const [Electron, CollectionsService],
    directives: const [NgFor, NgClass, NgIf, NgModel])
class SettingsCollections {
  Electron electron;
  CollectionsService collectionsService;
  List<Map> collections;
  Map selectedCollection;

  SettingsCollections(this.electron, this.collectionsService) {
    collections = collectionsService.collections;
  }

  void newCollection() {}

  void removeCollection(collection) {}

  void selectCollection(collection) {
    selectedCollection = collection;
    electron.console.log("selectedCollection = ${selectedCollection['name']}");
  }
}
