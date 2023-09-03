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
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    Text(
                      mypoem.title,
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "Satisfy",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      mypoem.author,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
