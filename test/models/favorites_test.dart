import 'package:flutter_modules/modules/testing/view_model/favorite.dart';
import 'package:test/test.dart';

void main() {
  group('Testing App Provider', () {
    var favorites = Favorites();

    test('A new item should be added', () {
      var number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });

    test("A new itme should be removed", () {
      var number = 20;
      favorites.add(number);
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}
