import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Album {
    final int id;
    final String title;

    Album({this.id,this.title});

    factory Album.fromJson(Map<String ,dynamic> json){
        return Album(
                id: json['id'],
                title: json['title'],
        );
    }
}

main(){
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
    final TextEditingController _controller = TextEditingController();
    Future<Album> _future;

    @override
    Widget build(BuildContext context){
        return MaterialApp(
                title: 'Create Data Example',
                theme: ThemeData(
                        primarySwatch: Colors.blue,
                ),
                home: Scaffold(
                        appBar: AppBar(
                                title: Text('Create Data Example'),
                        ),
                        body: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(8.0),
                                child: (_future == null)
                                ? Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                            TextField(
                                                    controller: _controller,
                                                    decoration: InputDecoration(hintText: 'Enter title'), 
                                            ),
                                            ElevatedButton(
                                                    child: Text('Create Data'),
                                                    onPressed: (){
                                                        setState(() {
                                                            _future = createAlbum(_controller.text);
                                                        });
                                                    },

                                            )
                                        ],
                                ) 
                                : FutureBuilder<Album>(
                                        future: _future,
                                        builder: (context, snapshot){
                                            if(snapshot.hasData){
                                                return Text(snapshot.data.title);
                                            }else if(snapshot.hasError){
                                                return Text("${snapshot.error}");
                                            }

                                            return CircularProgressIndicator();
                                        },
                                ),
                        ),
                )
        );
    }

}
Future<Album> createAlbum(String title) async {
    final respone = await http.post('https://jsonplaceholder.typicode.com/albums',
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
                'title': title,
            }));
    
    if(respone.statusCode == 201){
        return Album.fromJson(jsonDecode(respone.body));
    }else{
        throw Exception('Failed to create album');
    }
}
