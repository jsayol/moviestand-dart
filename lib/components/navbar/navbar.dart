// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library moviestand.navbar;

import 'package:angular2/angular2.dart' show Component, FORM_DIRECTIVES, NgFor, NgClass, NgIf;
import 'package:angular2/router.dart' show Location, RouterLink;
import 'package:moviestand/services/collections.dart';
import 'package:moviestand/pipes.dart';
import 'package:moviestand/filters.dart';

@Component(
    selector: 'ms-navbar',
    templateUrl: 'navbar.html',
    pipes: const [OrderByPipe],
    viewProviders: const [Location, FilterFactory, CollectionsService],
    directives: const [FORM_DIRECTIVES, RouterLink, NgFor, NgClass, NgIf])
class NavBar {
  Location location;
  FilterFactory filter;
  CollectionsService collections;
  Collection selectedCollection;

  NavBar(this.location, this.filter, this.collections);

  bool isPath(path) => path == location.path() ||
      ((path.length > 0) && (location.path().indexOf(path) == 0));
}
