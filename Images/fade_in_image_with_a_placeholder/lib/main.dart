import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){

        final title = 'Fade in images';

        return MaterialApp(
                title: title,
                home: Scaffold(
                        appBar: AppBar(
                                title: Text(title),
                        ),
                        body: Center(
                                child: FadeInImage.assetNetwork(
                                        placeholder: 'assets/loading.gif',
                                        image: 'https://picsum.photos/250?image=9'
                                ),
                        ),
                ),
        );
    }
}

void main() => runApp(MyApp());
