class Crop {
  final String imageUrl;
  final String name;

  static List<Crop> crops = [
    Crop(
        'https://healthyfamilyproject.com/wp-content/uploads/2020/05/Cabbage-background.jpg',
        'Cabbage'),
    Crop('https://kj1bcdn.b-cdn.net/media/38476/pea.png', 'Pea'),
    Crop(
        'https://cdn.theatlantic.com/thumbor/woR9UVVtFp9f5yl9Xul4HxQ4Hd4=/0x72:1000x635/960x540/media/img/mt/2015/05/shutterstock_247399801/original.jpg',
        'Onion'),
    Crop(
        'https://www.rd.com/wp-content/uploads/2021/06/GettyImages-939779058.jpg?fit=700,1024',
        'Tomato'),
    Crop(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Heaps_of_beans.jpg/640px-Heaps_of_beans.jpg',
        'Beans'),
    Crop(
        'https://femina.wwmindia.com/thumb/content/2019/dec/benefits-of-carrots1575626304.jpg?width=1200&height=900',
        'Carrots'),
    Crop('https://kj1bcdn.b-cdn.net/media/43037/eggplant.png', 'Brinjal'),
    Crop(
        'https://cdn.shopify.com/s/files/1/0432/2849/6022/products/lady-finger_434x.jpg?v=1603233095',
        'LadyFinger'),
    Crop(
        'https://healthyfamilyproject.com/wp-content/uploads/2020/05/Potatoes-background.jpg',
        'Potato'),
    Crop(
        'https://post.healthline.com/wp-content/uploads/2020/09/AN88-Cucumbers-732x549-thumb-1-732x549.jpg',
        'Cucumber'),
  ];

  Crop(this.imageUrl, this.name);
}
