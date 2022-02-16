class History {
  final String imageUrl;
  final String title;
  final String date;
  final String status;

  History(this.imageUrl, this.title, this.date, this.status);

  static List<History> history = [
    History(
        'https://logodownload.org/wp-content/uploads/2020/02/zomato-logo-2.png',
        'Panner , Soya Sauce',
        '20 Jan 2022, 06:03 PM',
        '✔'),
    History(
        'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80',
        'Gravy Rice , Mix Veg',
        '1 Feb 2022, 08:45 PM',
        '✔'),
    History(
        'https://cdn.shopify.com/s/files/1/1768/8207/files/OFRF-logo_transparent_240x240.jpg',
        'Farmers Foundation',
        '13 Feb 2022, 10:03 AM',
        '\$${5}'),
    History(
        'https://logodownload.org/wp-content/uploads/2019/05/uber-eats-logo-1.png',
        'Pizza Piece , Some Salad',
        '30 Feb 2022, 12:00 PM',
        '✔'),
    History(
        'https://filantropi.or.id/web2020/wp-content/uploads/2021/05/edufarmersfoundation.png',
        'EduFarmers Foundation',
        '9 March 2022, 9:08 AM',
        '\$${10}'),
  ];
}
