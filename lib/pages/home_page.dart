import 'package:flutter/material.dart';
import 'package:superheroesapp/quiz.dart';

class SuperHeroesPage extends StatefulWidget {
  const SuperHeroesPage({super.key});

  @override
  State<SuperHeroesPage> createState() => _SuperHeroesPageState();
}

class _SuperHeroesPageState extends State<SuperHeroesPage> {
  Quiz quiz = Quiz();
  Widget resultado = SizedBox();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "¿Cómo se llama el superheroe?",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: 300,
                child: Image.network(quiz.getImage(), fit: BoxFit.cover),
              ),
            ),
            Column(
              children: List.generate(quiz.getOptions().length, (index) {
                String option = quiz.getOptions()[index];

                return ElevatedButton(
                  onPressed: () {
                    bool esCorrecto = quiz.checkAnswer(option);

                    setState(() {
                      resultado = esCorrecto
                          ? Icon(Icons.check, color: Colors.green, size: 40)
                          : Icon(Icons.close, color: Colors.red, size: 40);
                      quiz.nextQuestion();
                    });
                  },
                  child: Text(option),
                );
              }),
            ),
            SizedBox(height: 20),
            resultado,
          ],
        ),
      ),
    );
  }
}
