import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/model/number_trivia_model.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/entity/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixture/fixture_reader.dart';

void main() {
  const tNumberTriviaModel = NumberTrivialModel(number: 1, text: 'Test text');

  test('shoud be a subclass of NumberTrivia entity', () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test(
      'should return valid model when the JSON number is an integer',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia.json'));
        
        // act
        final result = NumberTrivialModel.fromJson(jsonMap);

        // assert
        expect(result, tNumberTriviaModel);
      },
    );

    test(
      'should return valid model when the JSON number is an double',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia_double.json'));
        
        // act
        final result = NumberTrivialModel.fromJson(jsonMap);

        // assert
        expect(result, tNumberTriviaModel);
      },
    );
  });
}
