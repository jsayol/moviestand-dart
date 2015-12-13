// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library moviestand.movielist;

import 'package:angular2/angular2.dart' show Component, NgFor, NgIf;
import 'package:angular2/router.dart' show Router, RouteParams;
import 'package:moviestand/services/collections.dart';
import 'package:moviestand/pipes.dart';
import 'package:moviestand/filters.dart';

@Component(
    selector: 'ms-movielist',
    templateUrl: 'movielist.html',
    pipes: const [MovieListFilter, OrderByPipe],
    viewProviders: const [
      FilterFactory,
      CollectionsService
    ],
    directives: const [NgFor, NgIf])
class MovieList {
  static Map<String, MovieList> _cache = new Map<String, MovieList>();

  FilterFactory filter;
  Collection collection;
  String orderParam = 'filename';

  factory MovieList(Router router, RouteParams routeParams,
      FilterFactory filter, CollectionsService collectionsService) {
    String id = routeParams.get("id");
    String redirect;

    if (id.isEmpty) {
      Collection first = collectionsService.list.first;
      if (first != null) {
        // No collections has been specified, go to the first one
        redirect = '/collection/${first.id}';
      } else {
        // There are no collections, go to settinga
        redirect = '/settings';
      }
    }

    if (redirect != null) {
      router.navigateByUrl(redirect);
      return null;
    } else {
      _cache[id] ??= new MovieList._new(id, filter, collectionsService);
      return _cache[id];
    }
  }

  MovieList._new(String id, this.filter, CollectionsService collectionsService)
      : collection = collectionsService.list.firstWhere((c) => c.id == id);

  String countries(movie) => '';
  String genres(movie) => '';
}
