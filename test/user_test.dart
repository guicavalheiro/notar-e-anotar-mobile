import 'package:flutter_test/flutter_test.dart';
import 'package:notar_e_anotar_app/services/api.dart';

void main() {
  group('User testing', () {
    var user = User(firstName: 'Rafael', lastName: 'Silva', childName: 'Guilherme Silva', email: 'rafael.silva@gmail.com', password: '123123');

    test('Testing user first name', (){
      expect(user.firstName, 'Rafael');
    });

    test('Testing user last name', (){
      expect(user.lastName, 'Silva');
    });

    test('Testing user childName', (){
      expect(user.childName, 'Guilherme Silva');
    });

    test('Testing user email', (){
      expect(user.email, 'rafael.silva@gmail.com');
    });

    test('Testing user password', (){
      expect(user.password, '123123');
    });

    test('Testing user change password', (){
      user.password = '123456';
    expect(user.password, '123456');
    });
  });

}
