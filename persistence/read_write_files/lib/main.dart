import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main(){
	runApp(
			MaterialApp(
					title: 'Reading and Wrting Files',
					home: FlutterDemo(storage: CounterStorage())
			));
}


class CounterStorage {
	Future<String> get _localPath async{
		final directory = await getApplicationDocumentsDirectory();

		return directory.path;
	}

	Future<File> get _localFile async{
		final path = await _localPath;

		return File('$path/counter.txt');
	}

	Future<int> readCounter() async{
		try{
			final file = await _localFile;

			String contents = await file.readAsString();

			return int.parse(contents);
		}catch(e){
			return 0;

		}
	}

	Future<File> writeCounter(int counter) async{
		final file = await _localFile;

		return file.writeAsString('$counter');
	}
}

class FlutterDemo extends StatefulWidget{
	final CounterStorage storage;

	FlutterDemo({Key key, this.storage}) : super(key: key);

	@override
	_FlutterDemoState createState() {
		return _FlutterDemoState();
	}
}

class _FlutterDemoState extends State<FlutterDemo>{
	int _counter;

	@override
	void initState() {
		super.initState();
		widget.storage.readCounter().then((int value)=>{
			setState((){
				print("$_counter");
			})
		});
	}

	Future<File> _incrementCounter(){
		widget.storage.writeCounter(this._counter+1).then((file) => setState((){
			this._counter += 1;
		}));
		
	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
				appBar: AppBar(
						title: Text('Reading and Wrting File'),
				),
				body: Center(
						child: Text(
								'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
						),

				),
				floatingActionButton: FloatingActionButton(
						onPressed: _incrementCounter,
						tooltip: 'Increment',
						child: Icon(Icons.add),
				)
		);
	}

}
