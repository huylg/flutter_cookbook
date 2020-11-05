import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

class Album {
    final int userid;
    final int id;
    final String title;

    Album({this.userid, this.id, this.title});


    factory Album.fromJson(Map<String,dynamic> json){
        return Album(
            userid: json['userid'],
            id: json['id'],
            title: json['title'],
        );
    }

}

Future<Album> fetchAlbum() async{
    final respone = await http.get(
            'https://jsonplaceholder.typicode.com/albums/1',
            headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
    );

    final responeJson = jsonDecode(respone.body);
    
    return Album.fromJson(responeJson);

}
