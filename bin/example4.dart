void main(List<String> args) async {
  await for (final number in getNumber()) {
    print(number);
  }

  try {
    await for (final name in getNames()) {
      print(name);
    }
  } catch (e) {
    print(e);
  }
}

List<String> names() => ['dinod', 'tharinda'];

// future => | ----- 1 SEC ----- X |
// stream => | ----- 1 SEC ----- X ----- 1 SEC ----- X ----- 1 SEC ----- XX |

Stream<int> getNumber() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    yield i;
  }
  yield -1;
}

Stream<String> getNames() async* {
  await Future.delayed(Duration(seconds: 1));
  yield 'John';
  throw Exception("Something went wrong");
  // yield 'Deo';
}
