import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';


main(){
	testWidgets('finds a Text Widgets',(WidgetTester tester)async{
		await tester.pumpWidget(MaterialApp(
						home: Scaffold(
								body: Text('H'),
						),
		));

		expect(find.text('H'),findsOneWidget);
	});


	testWidgets('finds widget by key',(WidgetTester tester)async{
		final key = Key('key');

		await tester.pumpWidget(MaterialApp(
						key: key,
						home: Container(),
		));

		expect(find.byKey(key),findsOneWidget);


	});

	testWidgets('finds a specific instance', (WidgetTester tester)async{
		
		final childWidget = Padding(padding: EdgeInsets.zero);

		await tester.pumpWidget(Container(child: childWidget,));

		expect(find.byWidget(childWidget),findsOneWidget);

		
	});

}

