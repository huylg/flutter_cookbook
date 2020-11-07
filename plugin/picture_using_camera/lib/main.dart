import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
	WidgetsFlutterBinding.ensureInitialized();

	final cameras = await availableCameras();
	
	print(cameras);

	final firstCamera = cameras.first;

	runApp(MaterialApp(
					theme: ThemeData.dark(),
					home: TakePictureScreen(
							camera: firstCamera,
					),
	));
}

class TakePictureScreen extends StatefulWidget{
	final CameraDescription camera;

	const TakePictureScreen({
		Key key,
		@required this.camera,
	}) : super(key: key);
	
	@override
	_TakePictureScreenState createState() {
		return _TakePictureScreenState();
	}
}

class _TakePictureScreenState extends State<TakePictureScreen>{
	CameraController _controller;
	Future<void> _initializeControllerFuture;

	@override
	void initState(){
		super.initState();
		
		_controller = CameraController(
				widget.camera,
				ResolutionPreset.medium
		);
	}

	@override
	void dispose(){
		_controller.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
				appBar: AppBar(
						title: Text('')
				),
				body: FutureBuilder(
						future: _initializeControllerFuture,
						builder: (context, snapshot){
							if(snapshot.connectionState == ConnectionState.done){
								return CameraPreview(this._controller);
							}else{
								return Center(child: CircularProgressIndicator());
							}
						},
				),
				floatingActionButton: FloatingActionButton(
						child: Icon(Icons.camera_alt),
						onPressed:  () async {
							try{
								await _initializeControllerFuture;
								final path = join(
										 
										(await getTemporaryDirectory()).path,
										'%{DateTime.now().png}',
								);

								await _controller.takePicture(path);

								Navigator.push(
										context,
										MaterialPageRoute(
												builder: (context) => DisplayPictureScreen(path: path),
										),
								);

							}catch(e){
								print(e);
							}
						}
				)
		);
	}
}

class DisplayPictureScreen extends StatelessWidget{
	final String path;

	const DisplayPictureScreen({Key key, this.path}): super(key: key);

	@override
	Widget build(BuildContext context){
		return Scaffold(
				appBar: AppBar(
						title: Text('Display Picture Screen')
				),
				body: Image.file(File(this.path)),
		);
	}
}

