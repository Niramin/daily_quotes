import 'package:daily_quotes/models/Poem.dart';
import 'package:daily_quotes/repository/irepository.dart';

class SampleRepo implements irepository {
  static final SampleRepo _singleton = SampleRepo._internal();
  factory SampleRepo() {
    return _singleton;
  }
  SampleRepo._internal();

  @override
  Poem getRandomPoem() {
    // for now generating sample poem
    // add time delay to simulate and test loading?
    Poem newPoem = Poem(
        title: "Krishna's Wrath",
        content: "Now, I am become Death \n the Destroyer of Worlds!",
        id: 0,
        author: "from Indian Mythology");

    return newPoem;
  }
}
