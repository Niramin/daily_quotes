import 'package:daily_quotes/screens/BackgroundSkies.dart';
import 'package:flutter/material.dart';

class PoemContent extends StatelessWidget {
  const PoemContent({
    super.key,
    required this.widget,
  });

  final MorningSky widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Text(
          
          widget.mypoem.content,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: "PoppinsLight",
          ),
        ),
      ),
    );
  }
}