import 'package:daily_quotes/models/Poem.dart';

abstract class irepository {
  Poem getRandomPoem();
  Future<Poem> getRandomPoemAsync();
}
