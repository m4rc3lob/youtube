import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyAKFm9_ipvIt79H7UmKfooBjBjMJq9XkEs";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";
const ID_CANAL_ORISMILDESNETO = "UC5XRwy5gbEuG2pr3wBVIqYQ";

class Api {

  pesquisar(String pesquisa) async {

    http.Response response = await http.get(
      URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          "&channelId=$ID_CANAL_ORISMILDESNETO"
          "&q=$pesquisa"
    );

    if (response.statusCode == 200) {

      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();

      for( var video in videos ){
        print("resultado: " + video.titulo);
      }

    } else {

    }

  }
}