import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class Todo{
    final String title;
    final String description;

    Todo(this.title, this.description);
}


main() => runApp(MaterialApp(
                title: 'Passing data',
                home: TodosScreen(
                        todos: List<Todo>.generate(
                                100,
                                (i) => Todo(
                                        "todo ${i}",
                                        "a description of what needs to be done for Todo $i", 
                                ) ),
                ),
));

class TodosScreen extends StatelessWidget{
    final List<Todo> todos;
    
    TodosScreen({Key key, this.todos}) : super(key: key);

    @override
    Widget build(BuildContext context){
        return Scaffold(
                appBar: AppBar(
                        title: Text('todos'),
                ),
                body: ListView.builder(
                        itemCount: this.todos.length,
                        itemBuilder: (context, index){
                            return ListTile(

                                    title: Text(todos[index].title),
                                    onTap: (){
                                        Navigator.push(context, MaterialPageRoute(

                                                        builder: (context) => DetailScreen(todo: todos[index]),
                                        ));
                                    },
                                    );
                        },
                ),
        );
    }

}

class DetailScreen extends StatelessWidget{
    final Todo todo;

    DetailScreen({Key key, this.todo}) : super(key: key);

    @override
    Widget build(BuildContext context){
        return Scaffold(
                appBar: AppBar(
                        title: Text(todo.title),
                ),
                body: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(todo.description),
                ),
        );
    }

}
