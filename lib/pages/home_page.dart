import 'package:flutter/material.dart';
import 'package:superheroesapp/quiz.dart';

class SuperHeroesPage extends StatefulWidget {
  const SuperHeroesPage({super.key});

  @override
  State<SuperHeroesPage> createState() => _SuperHeroesPageState();
}

class _SuperHeroesPageState extends State<SuperHeroesPage> {
  Quiz quiz = Quiz();
  List<bool> resultadosHistorial = [];
  int contador = 1;
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
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: List.generate(quiz.getOptions().length, (index) {
                  String option = quiz.getOptions()[index];

                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: 55,
                        horizontal: 40,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      bool esCorrecto = quiz.checkAnswer(option);

                      setState(() {
                        resultadosHistorial.add(esCorrecto);

                        contador++;
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
            ),
            SizedBox(height: 20),
            resultado,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(resultadosHistorial.length, (index) {
                bool esCorrecto = resultadosHistorial[index];

                return Row(
                  children: [
                    Text(
                      "${index + 1}.",
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(
                      esCorrecto ? Icons.check : Icons.close,
                      color: esCorrecto ? Colors.green : Colors.red,
                      size: 1,
                    ),
                    SizedBox(width: 8),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
