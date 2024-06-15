void main(List<String> args) async {
  print(await getUserName());
  print(await getAddress());
  print(await getPhoneNumber());
  print(await getCity());
  print(await getCountry());
  print(await getZipCode());
}

Future<String> getUserName() async => 'Dinod Tharinda';
Future<String> getAddress() => Future.value('Moratuwa');
Future<String> getPhoneNumber() =>
    Future.delayed(const Duration(seconds: 1), () => '555-555-555-55');

Future<String> getCity() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'Moratuwa';
}

Future<String> getCountry() async => "Sri Lanka";

//async keyword doesn't really contribute with anything....
Future<String> getZipCode() async =>
    Future.delayed(const Duration(seconds: 1), () => '10400');
