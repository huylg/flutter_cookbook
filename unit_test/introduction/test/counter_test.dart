import 'package:introduction/counter.dart';
import 'package:test/test.dart';

void main(){
	test('Counter value should be increment',(){
		final counter = Counter();

		counter.increment();

		expect(counter.value,1);
	});
}

