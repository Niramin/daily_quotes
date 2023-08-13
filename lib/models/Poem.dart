import 'package:flutter/material.dart';

class Poem {
  String title = "";
  String author = "";
  String content = "";
  int id = 0;
  Poem({String? title, String? author, String? content, int? id}) {
    if (title != null) {
      this.title = title;
    }

    if (author != null) {
      this.author = author;
    }

    if (content != null) {
      this.content = content;
    }

    if (id != null) {
      this.id = id;
    }
  }
}
