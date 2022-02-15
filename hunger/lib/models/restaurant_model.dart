class Restaurant {
  final String imageUrl;
  final String name;

  const Restaurant({
    required this.imageUrl,
    required this.name,
  });

  static List<Restaurant> onlineRestaurants = [
    const Restaurant(
      name: 'Zomato',
      imageUrl:
          'https://logodownload.org/wp-content/uploads/2020/02/zomato-logo-2.png',
    ),
    const Restaurant(
      name: 'Swiggy',
      imageUrl:
          'https://i.pinimg.com/originals/54/b1/7e/54b17e6c6aebb44f5fc3621af5a11033.png',
    ),
    const Restaurant(
      name: 'Uber Eats',
      imageUrl:
          'https://logodownload.org/wp-content/uploads/2019/05/uber-eats-logo-1.png',
    ),
  ];

  static List<Restaurant> restaurants = [
    const Restaurant(
      name: 'Golden Ice Gelato ',
      imageUrl:
          'https://images.unsplash.com/photo-1479044769763-c28e05b5baa5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    ),
    const Restaurant(
      name: 'Il Panino del Laghetto',
      imageUrl:
          'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    ),
    const Restaurant(
      name: 'Viaggi Nel Gusto',
      imageUrl:
          'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80',
    ),
    const Restaurant(
      name: 'Burgers',
      imageUrl:
          'https://images.unsplash.com/photo-1550547660-d9450f859349?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80',
    ),
    const Restaurant(
      name: 'Tandoori Bites',
      imageUrl:
          'https://images.unsplash.com/photo-1428515613728-6b4607e44363?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    )
  ];
}
