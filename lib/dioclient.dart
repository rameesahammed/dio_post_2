import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio_post/model2.dart';

class dioClient{
  final String baseUrl="http://staging.finprov.com/wp-json";
  Future<User?> createUser({required String username,required String password}) async{
    User? retrievedUser;

    try{
      Response response;
      var dio = Dio();
      final _baseUrl = baseUrl;
      response = await dio.post(
        _baseUrl + "/jwt-auth/v1/token/",
        data: {"username":"finprov_admin","Password":"Finprov_admin@2022"},
      );
      print (response.data);
      retrievedUser = User.fromJson(response.data);
      // if(retrievedUser!=null) {
      //
      //
      //   print('User created: ${response.data}');
      // }


    }
    catch(e){
      print('Error creating user: $e');
    }
    return retrievedUser;


  }
}