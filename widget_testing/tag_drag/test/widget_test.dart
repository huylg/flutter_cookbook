import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main()  {
	
	testWidgets('add and remove a todo', (WidgetTester tester) async {
		await tester.pumpWidget(TodoList()); 


		await tester.enterText(find.byType(TextField),'hi');


		await tester.tap(find.byType(FloatingActionButton));


		await tester.pump();


		expect(find.text('hi'),findsOneWidget);


		await tester.drag(find.byType(Dismissible),Offset(500.0,0.0));

		await tester.pumpAndSettle();


		expect(find.text('hi'),findsNothing);




	});

}

class TodoList extends StatefulWidget{
	@override
	_TodoListState createState()=> _TodoListState();
}

class _TodoListState extends State<TodoList>{

	static const appTitle = "Todo List";

	final todos = <String>[];

	final controller = TextEditingController();

	@override
	Widget build(BuildContext context){

		return MaterialApp(

				title: appTitle,
				home: Scaffold(

						appBar: AppBar(title: Text(appTitle)),
						body: Column(
								children: [
									TextField(controller: controller,),
									Expanded(
											child: ListView.builder(
													itemCount: todos.length,
													itemBuilder: (context,index){
														final todo = todos[index];
														return Dismissible(
																key: Key('$todo$index'),
																onDismissed: (direction) => todos.removeAt(index),
																child: ListTile(title: Text(todo),),
																background: Container(color: Colors.red,),
														);
													},
											),
									),
								],
								
						),
						floatingActionButton: FloatingActionButton(
								onPressed: (){
									setState(() {
																		  todos.add(controller.text);
																		  controller.clear();
																		});
								},
								child: Icon(Icons.add),
						),
				), 
		);

	}


}

