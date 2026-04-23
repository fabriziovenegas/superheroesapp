class QuestionsModel {
  String question = "¿Como se llama el superhéroe";
  String urlImage;
  List<String> options = [
    "Capitán América",
    "Iron Man",
    "Thor",
    "Spider-Man",
    "Flash",
  ];
  String answer;
  QuestionsModel({required this.urlImage, required this.answer});
}
