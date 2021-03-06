import 'package:flutter_clean_architecture/features/number_trivia/data/model/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint
  /// 
  /// Throws a [ServerException] for all error codes
  Future<NumberTrivialModel> getConcreteNumberTrivia(int number);

  /// Calls the http://numbersapi.com/random endpoint
  /// 
  /// Throws a [ServerException] for all error codes
  Future<NumberTrivialModel> getRandomNumberTrivia();
}
