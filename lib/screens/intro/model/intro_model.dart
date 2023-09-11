
class Items {
  final String img;
  final String title;
  final String subTitle;

  ///
  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> listOfItems = [
  Items(
    img: "assets/images/37339-confused-person-finds-solution.json",
    title:"Find Movie",
    subTitle:"Many films that you can find including\n your favourite movie"
    ,
  ),
  Items(
    img: "assets/images/47222-play.json",
    title: "Play Movie",
    subTitle:
    "play lots of your favourite movies for free with out limits",
  ),
  Items(
    img: "assets/images/42796-take-a-ticket.json",
    title:"Book your Ticket",
    subTitle: "You can book your Movie Ticket from our App ",
  ),
];