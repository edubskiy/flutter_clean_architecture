import 'package:flutter_clean_architecture/features/number_trivia/data/model/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  /// Gets the cached [NumberTriviaModel] which got last time
  /// the user had internet connection
  /// 
  /// Throws [CacheException] if no cached data is present
  Future<NumberTrivialModel> getLastNumberTrivia();
  
  Future<void> cacheNumberTrivia(NumberTrivialModel triviaToCache);
}
