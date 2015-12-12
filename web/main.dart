// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library moviestand.web;

import 'package:angular2/angular2.dart' show provide;
import 'package:angular2/bootstrap.dart';
import 'package:angular2/router.dart'
    show
        APP_BASE_HREF,
        HashLocationStrategy,
        LocationStrategy,
        ROUTER_PROVIDERS,
        ROUTER_PRIMARY_COMPONENT;
import 'package:moviestand/moviestand.dart';

main() {
  bootstrap(Moviestand, [
    ROUTER_PROVIDERS,

    //Router primary component
    provide(ROUTER_PRIMARY_COMPONENT, useValue: Moviestand),

    // The base path of your application
    provide(APP_BASE_HREF, useValue: '/')

    // uncomment this if you want to use '#' in your url
    , provide(LocationStrategy, useClass: HashLocationStrategy)
  ]);
}
