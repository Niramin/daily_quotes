import 'package:daily_quotes/common/Helper.dart';
import 'package:daily_quotes/models/Poem.dart';
import 'package:daily_quotes/repository/irepository.dart';
import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset({String poemid="p0"}) async {
  return await rootBundle.loadString('assets/poems/$poemid.txt');
}




class Poems implements irepository {
  static final Poems _singleton = Poems._internal();
  factory Poems() {
    return _singleton;
  }
  Poems._internal();


  Future<String> loadAsset({int poemid=0}) async {
    String fileText = await rootBundle.loadString('assets/poems/p$poemid');
    return fileText;
    
  }

  @override
  Poem getRandomPoem() {
    // for now generating sample poem
    // add time delay to simulate and test loading?
    

    Poem newPoem = Poem(
        title: "Krishna's Wrath",
        content: "Now, I am become Death \nthe Destroyer of Worlds!Hey Arjuna,\n whenever dharma falls in society leading to the rise of adharma,\n I will interfere to restore dharma\nNow, I am become Death \nthe Destroyer of Worlds!\nHey Arjuna, whenever dharma falls in society leading to the rise of adharma,\n I will interfere to restore dharma",
        id: 0,
        author: "from Indian Mythology");

    return newPoem;
  }

  @override
  Future<Poem> getRandomPoemAsync()
  async {
      int id =0;
      id = helper.next(0, 21);
      String poemFile =  await loadAsset(poemid:id);
        var poemLines = poemFile.split("\n");
        Poem newPoem = Poem(
        title: poemLines[0],
        content: poemLines.sublist(2,poemLines.length).join("\n"),
        id: id,
        author: poemLines[1]);

    return newPoem;
  }
  
 

}

