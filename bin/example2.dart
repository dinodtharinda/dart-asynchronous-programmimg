void main(List<String> args) async {
  try {
    print(await getFullName(
      firstName: "Dinod",
      lastName: 'Tharinda',
    ));

    print(await getFullName(
      firstName: "",
      lastName: 'Tharinda',
    ));
  } on FirstOrLastNameMissingException {
    print('First or Last name is missing....');
  }
}

Future<String> getFullName({
  required String firstName,
  required String lastName,
}) {
  if (firstName.isEmpty || lastName.isEmpty) {
    throw FirstOrLastNameMissingException();
  } else {
    return Future.value("$firstName $lastName");
  }
}

class FirstOrLastNameMissingException implements Exception {
  const FirstOrLastNameMissingException();
}
