import 'package:flutter/material.dart';

void main() => runApp(SnackBarDemo());

class SnackBarDemo extends StatelessWidget{
    @override
    Widget build(BuildContext){
        return MaterialApp(
                title: 'SnackBar Demo',
                home: Scaffold(
                        appBar: AppBar(
                                title: Text('SnackBar Demo'),
                        ),
                        body: SnackBarPage(),
                ),
        );
    }
}

class SnackBarPage extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return Center(
                child: ElevatedButton(
                        onPressed: (){
                            final snackBar = SnackBar(
                              content: Text('Yay! A SnackBar!'),
                              action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: (){

                                      },
                              ),

                            );

                            Scaffold.of(context).showSnackBar(snackBar);
                        },
                        child: Text('Show SnackBar'),
                ),
        );
    }
}
