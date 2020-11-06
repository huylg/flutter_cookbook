import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
                title: 'Returning Data',
                home: HomeScreen(),
));


class HomeScreen extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return Scaffold(
                appBar: AppBar(
                        title: Text('Returning Data Demo'),
                ),
                body: Center(child: SelectionButton(),),
        );
    }
}

class SelectionButton extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return ElevatedButton(
                child: Text('go'),
                onPressed: (){
                    _navigateAndDisplaySelection(context); 
                },
        );
    }
}

_navigateAndDisplaySelection(BuildContext context) async{
    final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text("$result"),));
}


class SelectionScreen extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return Scaffold(
                appBar: AppBar(
                        title: Text('Pick up option'),
                ),
                body: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: ElevatedButton(
                                                onPressed: (){
                                                    Navigator.pop(context, 'Yep!');
                                                },
                                                child: Text('Yep!'),
                                        ),
                                ),
                                Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: ElevatedButton(
                                                onPressed: (){
                                                    Navigator.pop(context, 'Nope');
                                                },
                                                child: Text('Nope.'),
                                        ),
                                ),
                            ],
                        ),
                ),

        );
      
    }
}
