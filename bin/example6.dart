void main(List<String> args) async {
  // int sum = 0;
  // await for (final age in getAllAges()) {
  //   sum += age;
  // }
  // print(sum);

  final sum =await getAllAges().reduce((a, b) => a + b);
  print(sum);
}

Stream<int> getAllAges() async* {
  yield 10;
  yield 20;
  yield 30;
  yield 40;
  yield 50;
}
