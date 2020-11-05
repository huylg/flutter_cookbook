import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Album{
    final int id;
    final String title;

    Album({this.id, this.title});

    factory Album.fromJson(Map<String, dynamic> json){
        return Album(
                id: json['id'],
                title: json['title'],
        );
    }
}

void main(){
    runApp(MyApp());
}

class MyApp extends StatefulWidget{
    MyApp({Key key}) : super(key: key);

    @override
    _MyAppState createState(){
        return _MyAppState();
    }
}

class _MyAppState extends State<MyApp>{
    Future<Album> _futureAlbum;

    @override
    void initState(){
        super.initState();
        _futureAlbum = fetchAlbum();
    }

    @override
    Widget build(BuildContext context){
        return MaterialApp(
                title: 'Delete App Example',
                theme: ThemeData(
                        primarySwatch: Colors.blue
                ),
                home:  Scaffold(
                        appBar: AppBar(
                                title: Text('Delete Data Example'),
                        ),
                        body: FutureBuilder<Album>(
                                future: _futureAlbum,
                                builder: (context,snapshot){
                                    if(snapshot.connectionState == ConnectionState.done){
                                        if(snapshot.hasData){
                                            return Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                        Text('${snapshot.data?.title ?? 'Deleted'}'),
                                                            ElevatedButton(
                                                                    child: Text('Delete Data'),
                                                                    onPressed: (){
                                                                        setState(() {
                                                                            _futureAlbum = deleteAlbum(snapshot.data.id.toString());
                                                                        });
                                                                    },
                                                            ),
                                                    ],
                                                    );
                                                        }
                                        }else if (snapshot.hasError){
                                            return Text("${snapshot.error}");
                                        }

                                        return CircularProgressIndicator();
                                    },
                                    ),
                                    ),
                                    );
                                }

    }

    Future<Album> fetchAlbum() async{

        final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

        if(response.statusCode == 200){
            return Album.fromJson(jsonDecode(response.body));
        }else {
            throw Exception('Failed to local album');
        }

    }

    Future<Album> deleteAlbum(String id) async {
        final respone = await http.delete(
                'https://jsonplaceholder.typicode.com/albums/$id',
                headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                },
        );

        if(respone.statusCode == 200){
            return Album.fromJson(jsonDecode(respone.body));
        }else{
            throw Exception('Failed to delete album');
        }
    }
