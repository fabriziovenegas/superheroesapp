import 'package:superheroesapp/models/questions_model.dart';

class Quiz {
  int questionIndex = 0;
  List<QuestionsModel> questionList = [
    QuestionsModel(
      urlImage:
          "https://media.gq.com.mx/photos/5be9c4bb5c1fcb178a4c276f/4:3/w_2248,h_1686,c_limit/capitan_america_chris_evans_desmiente_tuit_de_despedida__6401.jpg",
      answer: "Capitán América",
    ),
    QuestionsModel(
      urlImage:
          "https://hips.hearstapps.com/hmg-prod/images/iron-man-1-1554387074.jpg",
      answer: "Iron Man",
    ),
    QuestionsModel(
      urlImage:
          "https://f.rpp-noticias.io/2020/03/29/205420_920580.jpg?width=1020&quality=80",
      answer: "Thor",
    ),
    QuestionsModel(
      urlImage:
          "https://f.rpp-noticias.io/2026/03/18/325232_1849247.jpg?width=1020&quality=80",
      answer: "Spider-Man",
    ),
    QuestionsModel(
      urlImage:
          "https://i0.wp.com/www.gamerfocus.co/wp-content/uploads/2022/08/the-flash-serie-cancelada-temporada-9-2.jpg?fit=1076%2C728&ssl=1",
      answer: "Flash",
    ),
  ];

  String getImage() {
    return questionList[questionIndex].urlImage;
  }

  List<String> getOptions() {
    return questionList[questionIndex].options;
  }

  bool checkAnswer(String option) {
    return option == questionList[questionIndex].answer;
  }

  void nextQuestion() {
    (questionIndex++);
  }
}
