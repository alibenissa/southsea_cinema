import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/user_settings.dart';

void main() {
  group('UserSettings model tests', () {
    test('default UserSettings has empty values', () {
      const UserSettings settings = UserSettings();

      expect(settings.name, isEmpty);
      expect(settings.address, isEmpty);
      expect(settings.email, isEmpty);
      expect(settings.receiveNewsletter, isFalse);
    });

    test('UserSettings stores the values passed in', () {
      const UserSettings settings = UserSettings(
        name: 'Ali Ben Issa',
        address: '10 Elm Road, Portsmouth',
        email: 'ali@example.com',
        receiveNewsletter: true,
      );

      expect(settings.name, 'Ali Ben Issa');
      expect(settings.address, '10 Elm Road, Portsmouth');
      expect(settings.email, 'ali@example.com');
      expect(settings.receiveNewsletter, isTrue);
    });
  });
}