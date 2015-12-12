// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library moviestand.header;

import 'package:angular2/angular2.dart' show Component;
import 'package:moviestand/electron/electron.dart';

@Component(
    selector: 'ms-header',
    templateUrl: 'header.html',
    viewProviders: const [Electron])
class Header {
  Electron electron;
  var win;

  Header(this.electron) {
    win = electron.currentWindow;
  }

  minimize() => win.minimize();

  close() => win.close();

  maximize() {
    if (win.isMaximized()) {
      win.unmaximize();
    } else {
      win.maximize();
    }
  }

  toggleFullscreen() => win.setFullScreen(!win.isFullScreen());

  toggleDevTools() => win.toggleDevTools();
}
