class Farmer {
  final String imageUrl;
  final String name;
  final String phoneno;
  final String mandi;
  final double deliveryFee;
  final int time;

  Farmer(this.imageUrl, this.name, this.phoneno, this.mandi, this.deliveryFee,
      this.time);

  static List<Farmer> farmers = [
    Farmer(
        'https://t3.ftcdn.net/jpg/04/32/15/18/360_F_432151892_oQ3YQDo2LYZPILlEMnlo55PjjgiUwnQb.jpg',
        'Guddu Rastogi',
        "tel://123456",
        'Naveen mandi',
        1.66,
        30),
    Farmer(
        'https://cdn.downtoearth.org.in/library/large/2019-07-24/0.37377100_1563954075_gettyimages-498281885.jpg',
        'Ram Singh Tiwari',
        "tel://443456",
        'Roza mandi',
        2,
        25),
    Farmer(
        'https://www.cam.ac.uk/sites/www.cam.ac.uk/files/styles/content-885x432/public/news/research/features/251017indian-farmer-in-biharm.defreesecimmyt.jpg?itok=SvDcPN5-',
        'Makaye Tola',
        "tel://1234556",
        'Mukari tola',
        1.50,
        45),
    Farmer(
        'https://www.globalagriculture.org/fileadmin/_processed_/csm_16Indien_DeFreese_CIMMYT_8cdf4cdcce.jpg',
        'Shribala Devi',
        "tel://123496",
        'Roza Gaon',
        3,
        40),
    Farmer(
        'https://media.wired.com/photos/5fe3cde89444c63750532aac/master/w_2560%2Cc_limit/Business-Indian-Women-Mobile-Phones1135064286-2.jpg',
        'Misty Singh',
        "tel://143456",
        'Lehar mandi',
        3,
        35),
  ];
}
