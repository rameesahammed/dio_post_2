import 'package:dio_post/model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
Future<DataModel?> createUser({required String name,required String job}) async{
  DataModel? retrievedUser;
  try{
    Response response;
    var dio = Dio();
    final _baseUrl = "https://reqres.in";
    response = await dio.post(
      _baseUrl + "/api/users",
      data: {"name":name,"job":job},
    );


      print('User created: ${response.data}');
      retrievedUser = DataModel.fromJson(response.data);

  }
  catch(e){
    print('Error creating user: $e');
  }
  return retrievedUser;


}

class _HomeState extends State<Home> {
  TextEditingController textController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,children: [
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder()),
            controller: textController,
          ),
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder()),
            controller: jobController,
          ),
          ElevatedButton(onPressed: ()async{
            String name = textController.text;
            String job = jobController.text;
            DataModel? data = await createUser(name: name,job: job) ;

          }, child: Text("submit"))
        ],),
      ),
    );
  }
}
