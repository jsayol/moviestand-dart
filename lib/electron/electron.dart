library moviestand.electron;

import 'dart:js';
// import 'dart:mirrors';
import 'package:angular2/angular2.dart';

@Injectable()
class Electron {
  final _Console console = new _Console();
  final _RequireProxy shell = new _RequireProxy('shell');
  final _RequireProxy remote = new _RequireProxy('remote');
  _BrowserWindow _window;

  Electron() {
    _window = new _BrowserWindow(remote);
  }

  _BrowserWindow get currentWindow => _window;

  // static void consoleLog(msg) => context['console'].callMethod('log', [msg]);

  static Function noSuchMethodProxy(self, obj) => (Invocation invocation) {
        JsObject retVal;
        String memberName = new RegExp(r'Symbol\("(\w+)"\)')
            .firstMatch(invocation.memberName.toString())
            .group(1);

        if (invocation.isMethod) {
          retVal = obj.callMethod(memberName, invocation.positionalArguments);
        } else if (invocation.isGetter) {
          retVal = obj[memberName];
        } else if (invocation.isSetter) {
          // TODO: do we need to implement setters?
        } else {
          throw new NoSuchMethodError(self, invocation.memberName,
              invocation.positionalArguments, invocation.namedArguments);
        }

        return retVal;
      };
}

class _RequireProxy {
  final JsObject _lib;

  _RequireProxy(String libName)
      : _lib = context.callMethod('require', [libName]);

  JsObject callMethod(method, [List args]) {
    return _lib.callMethod(method, args);
  }

  dynamic noSuchMethod(Invocation invocation) =>
      Electron.noSuchMethodProxy(this, _lib)(invocation);
}

class _BrowserWindow {
  final JsObject _win;

  _BrowserWindow(_RequireProxy remote)
      : _win = remote.callMethod('getCurrentWindow');

  dynamic noSuchMethod(Invocation invocation) =>
      Electron.noSuchMethodProxy(this, _win)(invocation);
}

class _Console {
  final _console = context['console'];

  void log(msg) => _console.callMethod('log', [msg]);
  void warn(msg) => _console.callMethod('warn', [msg]);
  void error(msg) => _console.callMethod('error', [msg]);

  // _Console();
}
