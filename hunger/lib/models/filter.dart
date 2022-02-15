class Filter {
  String value;
  bool selected;
  static bool filtered = false;

  static List<Filter> values = [
    Filter('any', false),
    Filter('50000', false),
    Filter('30000', false),
    Filter('1', false),
    Filter('1', false),
    Filter('any', false),
    Filter('salary', false)
  ];

  Filter(this.value, this.selected);

  set setSelected(bool value) {
    selected = value;
  }
}
