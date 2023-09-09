import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/model.dart';

class ApiServices{

  Future<Model?> getData()async{
    
    var response = await http.get(Uri.parse("https://reqres.in/api/unknown"));

    if(response.statusCode == 200 || response.statusCode ==201){
      Model model = Model.fromJson(json.decode(response.body));

      return model;
    }

    return null;
  }
}