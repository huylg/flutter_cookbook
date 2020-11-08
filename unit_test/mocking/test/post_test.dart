import 'package:flutter_test/flutter_test.dart';
import 'package:mocking/post.dart';

import 'package:mockito/mockito.dart';
import 'package:http/http.dart';

class MockClient extends Mock implements Client{}

main() {
	group('fetch post',(){
		test('return a Post if the http call completes successfully',()async{
			final client = MockClient();

			when(client.get('https://jsonplaceholder.typicode.com/posts/1')).thenAnswer((_) async => Response(('{"title": "Test"}'),200));

			expect(await fetchPost(client), isA<Post>());
		});

		test('throws an expection if the http call completes with an error',(){
			final client = MockClient();
			when(client.get('https://jsonplaceholder.typicode.com/posts/1')).thenAnswer((_) async => Response('Not found', 404));
			expect(fetchPost(client),throwsException);
		});

	});
}

