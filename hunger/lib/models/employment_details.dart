class Employment {
  static List<Result> userSearches = [];
  static List<Result> searchResults = [];
}

class Result {
  // ignore: non_constant_identifier_names
  final String salary_min;
  final String place;
  final String description;
  final String title;
  final String company;
  final String url;

  Result(this.salary_min, this.place, this.description, this.url, this.title,
      this.company);

  factory Result.fromJson(dynamic json) {
    return Result(
      json['salary_min'].toString(),
      json['location']['display_name'],
      json['description'],
      json['redirect_url'],
      json['title'],
      json['company']['display_name'],
    );
  }
}
