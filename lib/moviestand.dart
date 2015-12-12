// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library moviestand.moviestand;

import 'package:angular2/angular2.dart' show Component;
import 'package:angular2/router.dart'
    show ROUTER_DIRECTIVES, Route, RouteConfig, RouteParams, Redirect, Router;
import 'package:moviestand/components.dart' show Header, NavBar, Settings;

@Component(
    selector: 'moviestand',
    directives: const [ROUTER_DIRECTIVES, Header, NavBar, Settings],
    templateUrl: 'package:moviestand/moviestand.html')
@RouteConfig(const [
  const Route(path: '/collection/:id', component: MovieList, name: 'Collection'),
  // const Route(path: '/movie/:movieHash', component: MovieDetail, name: 'Movie'),
  const Route(path: '/settings/...', component: Settings, name: 'Settings'),
  const Redirect(
      path: '/',
      redirectTo: const [
        './Collection',
        const {'id': ''}
      ])
])
class Moviestand {
  Router router;

  Moviestand(this.router) {
    router.subscribe((value) {
      print("Route changed to: $value");
    });
  }

  go(String path) {
    router.navigateByUrl('/$path');
  }
}

@Component(selector: 'collection', template: '<div>foo {{id}}</div>')
class MovieList {
  String id;

  MovieList(RouteParams routeParams) {
    id = routeParams.get("id");
  }
}
