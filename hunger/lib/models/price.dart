class Price {
  final int value;
  bool selected = false;

  Price(this.value, this.selected);

  static List<Price> prices = [
    Price(3, false),
    Price(5, false),
    Price(10, false)
  ];
}
