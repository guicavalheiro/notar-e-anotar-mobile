import 'package:flutter_test/flutter_test.dart';
import 'package:notar_e_anotar_app/services/api.dart';

void main() {
  group('Task testing', () {
    final task = Task(name: 'taskExample', challenge: false, description: 'Example task for testing', parentRating: 5, childrenRating: 6);
    
    test('Testing task name', (){
      expect(task.name, 'taskExample');
    });

    test('Testing task challange', (){
      expect(task.challenge, false);
    });

    test('Testing task description', (){
      expect(task.description, 'Example task for testing');
    });

    test('Testing task parent rating', (){
      expect(task.parentRating, 5);
    });

    test('Testing task children rating', (){
      expect(task.childrenRating, 6);
    });

  });
}
