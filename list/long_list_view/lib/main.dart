import 'package:flutter/material.dart';

void main (){
    runApp(MyApp(
                    items: List.generate(1000,(i)=>"Item $i"),
    ));
}

class MyApp extends StatelessWidget{
    final List<String> items;

    MyApp({Key key, @required this.items}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        final title = 'Long List';
        


        return MaterialApp(
                title: title,
                home: Scaffold(
                        appBar: AppBar(title: Text(title)),
                        body: ListView.builder(
                                itemCount: items.length,
                                itemBuilder: (context, index){
                                    final item = items[index];
                                    return Text('$item');                            
                                },
                        ),
                ),
        );


    }
}