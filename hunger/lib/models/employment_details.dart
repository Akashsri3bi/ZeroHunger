class Employment {
  final String jobs;

  Employment(this.jobs);

  //Mock data before api consumption

  static List<Employment> searchResults = [];
  static List<Employment> employments = [
    Employment('Engineeering'),
    Employment('Aerospace'),
    Employment('Doctor'),
    Employment('Farming'),
    Employment('RealEstate')
  ];
}
