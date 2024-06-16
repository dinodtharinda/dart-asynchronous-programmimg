import 'dart:async';

void main(List<String> args) async {
  await for (final name in getNames().absorbErrorsUsingHandleError()) {
    print(name);
  }

  await for (final name in getNames().absorbErrorsUsingHandles()) {
    print(name);
  }
}

extension AbsorbErrors<T> on Stream<T> {
  Stream<T> absorbErrorsUsingHandleError() => handleError((_, __) {});

  Stream<T> absorbErrorsUsingHandles() =>
      transform(StreamErrorAbsorber());
}

Stream<String> getNames() async* {
  yield 'John';
  yield 'Jack';
  throw 'All out of names';
}

class StreamErrorAbsorber<T> extends StreamTransformerBase<T, T> {
  @override
  Stream<T> bind(Stream<T> stream) {
    final controller = StreamController<T>();
    stream.listen(controller.sink.add,
        onError: (_) {}, onDone: controller.close);
    return controller.stream;
  }
}