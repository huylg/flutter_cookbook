import 'package:test/test.dart';
import 'package:introduction/counter.dart';


void main(){

	group('counter',(){
		test('should start at zero',(){
			Counter counter = Counter();
			expect(counter.value,0);
		});

		test('should be incremented',(){
			Counter counter = Counter();

			counter.increment();

			expect(counter.value,1);
		});

		test('should be decremented',(){
			Counter counter = Counter();

			counter.decrement();

			expect(counter.value,-1);

		});

	});

}
