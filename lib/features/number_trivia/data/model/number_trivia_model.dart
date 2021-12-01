import 'package:flutter_clean_architecture/features/number_trivia/domain/entity/number_trivia.dart';

class NumberTrivialModel extends NumberTrivia {
  const NumberTrivialModel({
    required String text,
    required int number,
  }) : super(text: text, number: number);

  factory NumberTrivialModel.fromJson(Map<String, dynamic> json) {
    return NumberTrivialModel(text: json['text'], number: (json['number'] as num).toInt(),);
  }
}
