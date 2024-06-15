void main(List<String> args) async {
  final result = getNames().asyncExpand((name) => getCharacters(name));
  await for(final character in result){
    print(character);
  }
}

Stream<String> getCharacters(String fromString) async* {
  for (var i = 0; i < fromString.length; i++) {
    await Future.delayed(const Duration(milliseconds: 300));
    yield fromString[i];
  }
}

Stream<String> getNames() async* {
  await Future.delayed(const Duration(milliseconds: 200));
  yield 'john';
  await Future.delayed(const Duration(milliseconds: 200));
  yield 'Deo';
}
