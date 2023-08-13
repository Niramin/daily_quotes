import 'package:daily_quotes/models/Poem.dart';
import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({
    super.key,
    required this.mypoem,
  });

  final Poem mypoem;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(
            child: Text(
              mypoem.title,
              style: TextStyle(
                fontSize: 30,
                fontFamily: "Satisfy",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
