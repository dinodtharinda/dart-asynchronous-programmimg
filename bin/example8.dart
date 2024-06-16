void main(List<String> args) async {}

Stream<String> maleNames() async* {
  yield 'john';
  yield 'Peter';
  yield 'Paul';
}

Stream<String> femaleNames() async* {
  yield 'Mary';
  yield 'Jane';
  yield 'Sue';
}

Stream<String> allName() async* {
  // await for (final maleName in maleNames()) {
  //   yield maleName;
  // }

  //  await for (final femaleName in femaleNames()) {
  //   yield femaleName;
  // }

  yield* femaleNames();
  yield* maleNames();
}
