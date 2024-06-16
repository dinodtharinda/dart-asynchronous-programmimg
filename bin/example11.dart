void main(List<String> args) async {
  final allName = await getNames().toList();

  for (final name in allName) {
    print(name);
  }
}

Stream<String> getNames() async* {
  yield 'John';
  yield 'Deo';
  yield 'Jack';
}
