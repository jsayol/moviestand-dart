// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library moviestand.settings.collections;

import 'package:angular2/angular2.dart'
    show Component, FORM_DIRECTIVES, NgFor, NgClass, NgIf;
import 'package:moviestand/services/collections.dart';
// import 'package:moviestand/electron/electron.dart';

@Component(
    selector: 'ms-settings-collections',
    templateUrl: 'settings.collections.html',
    viewProviders: const [CollectionsService],
    directives: const [FORM_DIRECTIVES, NgFor, NgClass, NgIf])
class SettingsCollections {
  CollectionsService collections;
  Map selectedCollection;

  SettingsCollections(this.collections) {}

  void newCollection() {}

  void removeCollection(collection) {}
}
