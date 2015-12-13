library moviestand.pipes;

import 'package:angular2/angular2.dart' show Pipe, Injectable;
// import 'package:moviestand/electron/electron.dart';

@Pipe(name: 'movieListFilter')
@Injectable()
class MovieListFilter {
  transform(list, List args) {
    String query = args[0].toLowerCase();
    String genre = args[1];
    String country = args[2];
    bool hideWatched = args[3];

    if (hideWatched) {
      list = list.where((e) => !e['watched']);
    }

    if (genre != null) {
      list = list.where((e) => e['genres'].map((v) => v['id']).contains(genre));
    }

    if (country != null) {
      list = list.where((e) => e['production_countries'].map((v) => v['id']).contains(country));
    }

    if (!query.isEmpty) {
      list = list.where((e) => e['title'].toLowerCase().contains(query));
    }

    return list.toList();
  }
}

@Pipe(name: 'orderBy')
@Injectable()
class OrderByPipe {
  transform(list, List args) {
    String param = args[0];
    list.sort((a, b) => a[param].compareTo(b[param]));
    return list;
  }
}
