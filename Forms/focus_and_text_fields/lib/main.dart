import 'package:flutter/material.dart';

void main(){
    runApp(MyApp());
}

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return MaterialApp(
                title: 'Text Field Focus',
                home: MyCustomForm(),
        );
    }
}

class MyCustomForm extends StatefulWidget{
    @override
    _MyCustomFormState createState(){
        return _MyCustomFormState();
    }
}

class _MyCustomFormState extends State<MyCustomForm>{
    FocusNode myFocusNode;

    @override
    void initState(){
        super.initState();

        this.myFocusNode = FocusNode();
    }


    @override
    void dispose(){
        myFocusNode.dispose();

        super.dispose();
    }

    @override
    Widget build(BuildContext context){
        return Scaffold(
                appBar: AppBar(
                        title: Text('Text Field Focus'),
                ),

                body: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                                children: <Widget>[TextField(
                                        //autofocus: true,
                                ),
                                TextField(
                                        focusNode: this.myFocusNode,
                                )
                                ],
                        )
                ),

                floatingActionButton: FloatingActionButton(
                    onPressed: () => myFocusNode.requestFocus(),
                    tooltip: 'focus Second Text Field',
                    child: Icon(Icons.edit),
                ),
        );
    }

}
