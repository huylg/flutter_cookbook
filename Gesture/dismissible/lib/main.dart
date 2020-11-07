import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{

	MyApp({Key key}): super(key: key);

	@override
	MyAppState createState(){
		return MyAppState();
	}
}

class MyAppState extends State<MyApp>{

	final items = List.generate(100,(i){
		return "Item $i";
	});
	
	@override
	Widget build(BuildContext context){
		return MaterialApp(
				title: 'Dimissing items',
				theme: ThemeData(
						primarySwatch: Colors.blue,
				),
				home: Scaffold(
						appBar: AppBar(
								title: Text('Dimissing items'),
						),
						body: ListView.builder(
								itemCount: this.items.length,
								itemBuilder: (context,index){
									final item = items[index];
									return Dismissible(
											key: Key(item),
											onDismissed: (direction){
												setState(() {
																								  items.removeAt(index);
																								});

												Scaffold.of(context).showSnackBar(SnackBar(content: Text('$item is dimissed')));

											},
											background: Container(color: Colors.red,),
											child: ListTile(title: Text('$item'),),
									);
								},
						),

				),
		);
	}

}
