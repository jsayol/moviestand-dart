// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library moviestand.navbar;

import 'package:angular2/angular2.dart' show Component, NgFor;
import 'package:angular2/router.dart' show Location, RouterLink;
import 'package:moviestand/services/collections.dart';

@Component(
    selector: 'ms-navbar',
    templateUrl: 'navbar.html',
    viewProviders: const [CollectionsService, Location],
    directives: const [RouterLink, NgFor])
class NavBar {
  Location location;
  List<Map> collections;

  NavBar(CollectionsService collectionsService, this.location) {
    collections = collectionsService.collections;
  }

  bool isPath(path) => path == location.path() ||
      ((path.length > 0) && (location.path().indexOf(path) == 0));
}
