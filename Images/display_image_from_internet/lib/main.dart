import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        
        var titile = 'Web Images';

        return MaterialApp(
            title: titile,
            home: Scaffold(
                    appBar: AppBar(
                            title: Text(titile),
                    ),
                    body: Image.network('https://picsum.photos/250?image=9',),

            ),
        );

    }
}

