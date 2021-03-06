import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main(){
	
	testWidgets('MyWidget has a title and message',(WidgetTester tester)async{
		await tester.pumpWidget(MyWidget(title: 'T',message: 'M'));

		final titleFinder = find.text('T');
		final messageFinder = find.text('M');
		
		expect(titleFinder, findsOneWidget);
		expect(messageFinder, findsOneWidget);

	});

}

class MyWidget extends StatelessWidget{
	final String title;
	final String message;

	MyWidget({Key key, @required this.title, @required this.message}): super(key: key);


	@override
	Widget build(BuildContext context){
		return MaterialApp(
				title: this.title,
				home: Scaffold(

						appBar: AppBar(title: Text(this.title)),
						body: Center(

								child: Text(this.message),
						),
				),
		);
	}

}

