import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:test/test.dart';

void main() {
  test('rx.Observable.min', () async {
    await expectLater(Observable<int>(_getStream()).min(), completion(0));
  });

  test('rx.Observable.min.with.comparator', () async {
    await expectLater(
        Observable<String>.fromIterable(<String>["one", "two", "three"])
            .min((String a, String b) => a.length - b.length),
        completion("one"));
  });
}

class ErrorComparator implements Comparable<ErrorComparator> {
  @override
  int compareTo(ErrorComparator other) {
    throw Exception();
  }
}

Stream<int> _getStream() =>
    Stream<int>.fromIterable(const <int>[2, 3, 3, 5, 2, 9, 1, 2, 0]);
