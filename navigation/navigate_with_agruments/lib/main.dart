import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return MaterialApp(
                onGenerateRoute: (settings){
                    if(settings.name == PassArgumentScreen.routename){
                        final ScreenArguments args = settings.arguments;

                        return MaterialPageRoute(
                                builder: (context){
                                    return PassArgumentScreen(
                                            title: args.title,
                                            message: args.message,
                                    );
                                },
                        );
                    }

                    assert(false, "Need to implement ${settings.name}");

                    return null;

                },
                title: 'Navigation with Argumrnts',
                home: HomeScreen(),
                routes: {
                    ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
                },
                );
    }
}

class HomeScreen extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return Scaffold(
                appBar: AppBar(

                        title: Text('Home Screen'),
                ),
                body: Center(
                        child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    ElevatedButton(
                                            child: Text("Navigte to screen that extracts arguments"),
                                            onPressed: (){
                                                //implement
                                                Navigator.pushNamed(
                                                        context,
                                                        ExtractArgumentsScreen.routeName,
                                                        arguments: ScreenArguments(
                                                                'Extract Arguments Screen',
                                                                'This message is extraced in the build method',
                                                        ),
                                                );
                                            },
                                    ),
                                    ElevatedButton(

                                            child: Text("Navigte to screen that pass arguments"),
                                            onPressed: (){
                                                Navigator.pushNamed(
                                                        context,
                                                        PassArgumentScreen.routename,
                                                        arguments: ScreenArguments(
                                                                'Pass Argument Screen',
                                                                'This message is extracted in the onGenerateRoute Function',
                                                        ),
                                                );
                                            },

                                    )
                                            ],
                                            ),
                                            ),
                                            );
    }
}

class ExtractArgumentsScreen extends StatelessWidget{
    static const routeName = '/extractArguments';

    @override
    Widget build(BuildContext context){
        final ScreenArguments args = ModalRoute.of(context).settings.arguments;
        return Scaffold(
                appBar: AppBar(
                        title: Text(args.title),
                ),
                body: Center(
                        child: Text(args.message),
                ),
        );
    }
}

class PassArgumentScreen extends StatelessWidget{
    static const routename = '/passArguments';

    final String title;
    final String message;

    const PassArgumentScreen({
        Key key,
        @required this.title,
        @required this.message,
        }): super(key: key);

    @override build(BuildContext context){
    return Scaffold(
            appBar: AppBar(

                    title: Text(title),
            ),
            body: Center(

                    child: Text(message)
            ),
    );
    }
}

class ScreenArguments {
    final String title;
    final String message;

    ScreenArguments(this.title, this.message);

}
