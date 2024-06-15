void main(List<String> args) async{
    print(await getUserName());
}

Future<String> getUserName()async => 'Dinod Tharinda';