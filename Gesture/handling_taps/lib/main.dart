import 'package:flutter/material.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		final String title = 'Gesture Demo';
		return MaterialApp(
				title: title,
				home: MyHomePage(title: title,),
		);
	}
}

class MyHomePage extends StatelessWidget{
	
	final String title ;

	MyHomePage({Key key, this.title}): super(key: key);

	@override
	Widget build(BuildContext context){
		return Scaffold(
				appBar: AppBar(
						title: Text(this.title),
				),
				body: Center(
						child: MyButton(),
				),
		);
	}
}

class MyButton extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		return GestureDetector(
				onTap: (){
					final snackBar = SnackBar(content: Text('tap'),);

					Scaffold.of(context).showSnackBar(snackBar);
				},
				child: Container(
							   padding: EdgeInsets.all(12.0),
							   decoration: BoxDecoration(

									   color: Theme.of(context).buttonColor,
									   borderRadius: BorderRadius.circular(8.0),
							   ),

							   child: Text('My BUtton'),
					   ),
		);
	}
}