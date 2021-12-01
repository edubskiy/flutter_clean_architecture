import 'package:flutter_clean_architecture/features/number_trivia/data/model/number_trivia_model.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/entity/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tNumberTriviaModel = NumberTrivialModel(number: 1, text: 'test');

  test('shoud be a subclass of NumberTrivia entity', () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });
}