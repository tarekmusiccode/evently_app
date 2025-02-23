class CategoryData {
  String name;
  String id;
  String image;

  CategoryData({required this.id, required this.name, required this.image});

  static List<CategoryData> categories = [
    // CategoryData(id: "all", name: "All", image: ""),
    CategoryData(
      id: "sport",
      name: "Sport",
      image: "assets/images/category/sport.png",
    ),
    CategoryData(
        id: "birthday",
        name: "Birthday",
        image: "assets/images/category/birthday.png"),
    CategoryData(
        id: "book_club",
        name: "book Club",
        image: "assets/images/category/book_club.png"),
    CategoryData(
        id: "eating",
        name: "Eating",
        image: "assets/images/category/eating.png"),
    CategoryData(
        id: "exhihition",
        name: "Exhihition",
        image: "assets/images/category/exhihition.png"),
    CategoryData(
        id: "gaming",
        name: "Gaming",
        image: "assets/images/category/gaming.png"),
    CategoryData(
        id: "holiday",
        name: "Holiday",
        image: "assets/images/category/holiday.png"),
    CategoryData(
        id: "meeting",
        name: "Meeting",
        image: "assets/images/category/meeting.png"),
    CategoryData(
        id: "work_shop",
        name: "WorkShop",
        image: "assets/images/category/work_shop.png"),
  ];
}
