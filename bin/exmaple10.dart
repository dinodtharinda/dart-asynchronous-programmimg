import 'dart:async';

void main(List<String> args) async {
  //first method....
  await for (final name in names.map(
    (name) => name.toUpperCase(),
  )) {
    print(name);
  }
  print('-------------------------------------');
  await for (final capitalizedName in names.capitalized) {
    print(capitalizedName);
  }

  print('-------------------------------------');
  await for (final capitalizedName in names.capitalizedUsingMap) {
    print(capitalizedName);
  }
}

extension on Stream<String> {
  Stream<String> get capitalized => transform(
        ToUpperCase(),
      );
  Stream<String> get capitalizedUsingMap => map(
        (name) => name.toUpperCase(),
      );
}

Stream<String> names = Stream.fromIterable(
  [
    'dinod',
    'tharinda',
    'athukorala',
  ],
);

class ToUpperCase extends StreamTransformerBase<String, String> {
  @override
  Stream<String> bind(Stream<String> stream) {
    return stream.map((name) => name.toUpperCase());
  }
}
