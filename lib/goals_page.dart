import 'dart:ffi';

import 'package:aquadoro/goal_card.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class GoalsPage extends StatefulWidget {
  @override
  GoalsPageState createState() => GoalsPageState();
}

class GoalsPageState extends State<GoalsPage> with TickerProviderStateMixin {
  final List<GoalCard> _metas = [];
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _fadeText(),
        backgroundColor: Colors.cyan[600],
      ),
      body: Stack(
        children: [
          Container(color: Colors.cyan[600]),
          Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemBuilder: (_, int index) => _metas[index],
                  itemCount: _metas.length,
                ),
              ),
              //Expanded(child: Container()),
              FloatingActionButton(
                onPressed: () {
                  _agregarCard();
                },
                child: Icon(
                  Icons.add_circle_outline,
                  color: Colors.cyan[50],
                  size: 50,
                ),
              ),
              Container(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  } //build

  Widget _fadeText() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: SizedBox(
        width: 350.0,
        child: FadeAnimatedTextKit(
            repeatForever: true,
            text: [
              "¿Qué es lo realmente",
              "importante?",
              "Vamos a hacerlo :)",
              "¿Qué has estado",
              "dejando pendiente?"
            ],
            textStyle: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey[50]),
            textAlign: TextAlign.center,
            alignment: AlignmentDirectional.bottomCenter // or Alignment.topLeft
            ),
      ),
    );
  } //fade text

  Void _agregarCard() {
    final animationCards = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    GoalCard meta = new GoalCard(
      animationController: animationCards,
    );
    setState(() {
      _metas.insert(_metas.length, meta);
    });
    meta.animationController.forward();
  }

  @override
  void dispose() {
    for (GoalCard meta in _metas) meta.animationController.dispose();
    super.dispose();
  }
}
