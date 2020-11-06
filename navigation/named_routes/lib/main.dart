
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return Scaffold(
                appBar: AppBar(
                        title: Text('First Screen'),
                ),
                body: Center(
                        child: ElevatedButton(
                                child: Text('go to second screen'),
                                onPressed: (){
                                    Navigator.pushNamed(context,'/second');
                                },
                        ),
                ),
        );
    }
}


class SecondScreen extends StatelessWidget{
    @override
    Widget build (BuildContext context){
        return Scaffold(

                appBar: AppBar(title: Text('Second Screen')),
                body: Center(
                        child: ElevatedButton(
                                child: Text('back to first screen'),
                                onPressed: (){
                                    Navigator.pop(context);
                                },
                        ),
                ),
        );
    }
}


main()=>runApp(MaterialApp(
                title: "Named Route",
                initialRoute: '/',
                routes:{
                    '/': (context) => FirstScreen(),
                    '/second': (context) => SecondScreen(),
                },
));
