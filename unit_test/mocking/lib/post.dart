import 'dart:convert';
import 'package:http/http.dart';
class Post{
	dynamic data;

	Post.fromJson(this.data);
}

Future<Post> fetchPost(Client client) async{
	final response = await client.get('https://jsonplaceholder.typicode.com/posts/1');

	if(response.statusCode == 200){
		
		return Post.fromJson(jsonDecode(response.body));

	}else{
		throw Exception('Failed to load post');
	}


}
