import 'package:dio_post/dioclient.dart';

import 'package:dio_post/model2.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}


// Future<DataModel?> createUser({required String name,required String job}) async{
//   DataModel? retrievedUser;
//
//   try{
//     Response response;
//     var dio = Dio();
//     final _baseUrl = " http://staging.finprov.com/wp-json";
//     response = await dio.post(
//       _baseUrl + "/jwt-auth/v1/token/",
//       data: {"username":name,"Password":job},
//     );
//  String someText =response.data;
//       if(response.statusCode==200) {
//
//         hasData=true;
//       print('User created: ${response.data}');
//     }
//     retrievedUser = DataModel.fromJson(response.data);
//
//   }
//   catch(e){
//     print('Error creating user: $e');
//   }
//   return retrievedUser;
//
//
// }

dioClient dioc = dioClient();


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
            String username = textController.text;
            String password = jobController.text;
            dioc.createUser(username: username,password: password) ;


          }, child: Text("submit")),


        ],),
      ),
    );
  }
}
