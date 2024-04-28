import 'package:gilded_rose/gilded_rose.dart';
import 'package:test/test.dart';

void main() {
  test('foo', () {
    var item = Item('foo', 0, 0);
    var items = <Item>[item];

    GildedRose app = GildedRose(items);
    app.updateQuality();
    expect("too", app.items[0].name);
  });
}
