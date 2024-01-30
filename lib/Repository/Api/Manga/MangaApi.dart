import 'dart:convert';

import 'package:http/http.dart';
import 'package:manga/Repository/Api/api_client.dart';
import 'package:manga/Repository/Model/MangaModel.dart';

class MangaApi{
  ApiClient apiClient=ApiClient();


  Future<MangaModel>getManga() async{
    String path ='https://mangaverse-api.p.rapidapi.com/manga/fetch';
    var body ={

    };
    Response response = await apiClient.invokeAPI(path, 'GET', body);
    return MangaModel.fromJson(jsonDecode(response.body));

  }
}