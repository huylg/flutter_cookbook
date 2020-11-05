import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
    runApp(MyApp());
}

class MyApp extends StatefulWidget{
    MyApp({Key key}): super(key: key);

    @override
    _MyAppState createState(){
        return _MyAppState();
    }
}

class _MyAppState extends State<MyApp>{
    final TextEditingController _controller = TextEditingController();
    
    Future<Albumn> _futureAlbumn;

    @override
    void initState(){
        super.initState();
        _futureAlbumn = fetchAlbumn();
    }

    @override
    Widget build(BuildContext context){
        return MaterialApp(
            title: 'Update Data Example',
            theme: ThemeData(
                    primarySwatch: Colors.blue,
            ),
            home: Scaffold(
                appBar: AppBar(
                                title: Text('Update Data Example'),
                        ),
                body: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: FutureBuilder<Albumn>(
                                future: _futureAlbumn,
                                builder: (context,snapshot){
                                    if(snapshot.connectionState == ConnectionState.done){
                                        if(snapshot.hasData){
                                            return Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                        Text((snapshot.data.title)),
                                                        TextField(
                                                                controller: _controller,
                                                                decoration: InputDecoration(hintText: 'Enter Title'),
                                                        ),
                                                        ElevatedButton(
                                                                child: Text('Update Data'),
                                                                onPressed: (){
                                                                    setState(() {
                                                                        _futureAlbumn = updateAlbumn(_controller.text);
                                                                    });
                                                                },
                                                        )
                                                    ],
                                            );
                                        }
                                    }else if(snapshot.hasError){
                                        return Text("${snapshot.error}");
                                    }

                                    return CircularProgressIndicator();
                                },
                        ),
                ),
            ),
        );
    }
    

}

Future<Albumn> fetchAlbumn() async{
    final respone = await http.get('https://jsonplaceholder.typicode.com/albums/1');

    if(respone.statusCode == 200){
        return Albumn.fromJson(jsonDecode(respone.body));
    }else{
        throw Exception('Faild to load albumn');
    }
}
Future<Albumn> updateAlbumn(String title) async{
    final respone = await http.put('https://jsonplaceholder.typicode.com/albums/1',headers: <String, String>{
                'Content-type': 'application/js, charset=UTF-8'
                },
                body: jsonEncode(<String, String>{
                    'title': title,
                }));
    
    if(respone.statusCode == 200){
        return Albumn.fromJson(jsonDecode(respone.body));
    }else{
        throw Exception('Failed to update albumn');
    }

}


class Albumn{
    final int id;
    final String title;
    
    Albumn({this.id, this.title});

    factory Albumn.fromJson(Map<String, dynamic> json){
        return Albumn(
                id: json['id'],
                title: json['title'],
        );
    }
}
