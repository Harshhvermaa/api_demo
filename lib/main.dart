import 'package:apniapi/Screens/UserList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserScreen(),
    );
  }
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  // Future<WorldStatesModel> fetchWorldRecords() async {
  //   final response = await http.get(Uri.parse(Appurl.worldstatesApi));

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     return WorldStatesModel.fromJson(data);
  //   } else {
  //     throw Exception('Error');
  //   }
  // }

  Future apiData() async {
    var result = await http.get(Uri.parse("http://localhost:3000/send"));
    print(result);

    // if (result.statusCode == 200) {
    //   print(result);
    //   var data = jsonDecode(result.body);
    //   print(data);
    //   return result.body;
    // } else {
    //   print("Data not exist");
    // }
  }

  @override
  Widget build(BuildContext context) {
    apiData();
    return const Scaffold(
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
