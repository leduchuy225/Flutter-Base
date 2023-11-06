import 'dart:async';

class MyDebouncer {
  final Duration delay;
  Timer? _timer;

  MyDebouncer({
    this.delay = const Duration(milliseconds: 500),
  });

  void call(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}

/*
  Example

  // Usage
  final _debouncer = MyDebouncer(delay: Duration(milliseconds: 1000));
  _debouncer(() {
    print('Giấc mơ trưa - Thùy Chi');
  });

  // Dispose
  _debouncer.dispose();
*/
