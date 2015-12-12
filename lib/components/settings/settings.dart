// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library moviestand.settings;

import 'package:angular2/angular2.dart' show Component, NgFor, NgClass;
import 'package:angular2/router.dart'
    show ROUTER_DIRECTIVES, Location, Route, RouteConfig, Redirect, Router;
import 'package:moviestand/components/settings/settings.collections.dart';
import 'package:moviestand/components/settings/settings.general.dart';
import 'package:moviestand/components/settings/settings.themes.dart';
import 'package:moviestand/components/settings/settings.about.dart';

@Component(
    selector: 'ms-settings',
    templateUrl: 'settings.html',
    viewProviders: const [Location],
    directives: const [ROUTER_DIRECTIVES, NgFor, NgClass])
@RouteConfig(const [
  const Route(
      path: '/collections',
      component: SettingsCollections,
      name: 'Settings.collections'),
  const Route(
      path: '/general', component: SettingsGeneral, name: 'Settings.general'),
  const Route(
      path: '/themes', component: SettingsThemes, name: 'Settings.themes'),
  const Route(path: '/about', component: SettingsAbout, name: 'Settings.about'),
  const Redirect(path: '/', redirectTo: const ['./Settings.collections'])
])
class Settings {
  final List entries;
  Location location;

  Settings(this.location)
      : entries = [
          {
            'name': 'Collections',
            'path': 'collections',
            'disabled': false,
            'icon': 'film'
          },
          {
            'name': 'Settings',
            'path': 'general',
            'disabled': false,
            'icon': 'cog'
          },
          {
            'name': 'Themes',
            'path': 'themes',
            'disabled': true,
            'icon': 'tint'
          },
          {
            'name': 'About',
            'path': 'about',
            'disabled': true,
            'icon': 'info-sign'
          }
        ];

  bool isPath(path) => '/settings/$path' == location.path() ||
      ((path.length > 0) && (location.path().indexOf('/settings/$path') == 0));
}
