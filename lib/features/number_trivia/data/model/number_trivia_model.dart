import 'package:flutter_clean_architecture/features/number_trivia/domain/entity/number_trivia.dart';

class NumberTrivialModel extends NumberTrivia {
  const NumberTrivialModel({
    required String text,
    required int number,
  }) : super(text: text, number: number);
}
