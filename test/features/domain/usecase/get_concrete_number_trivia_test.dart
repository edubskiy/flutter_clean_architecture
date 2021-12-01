import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/entity/number_trivia.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/repository/number_trivia_repository.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/usecase/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'get_concrete_number_trivia_test.mocks.dart';


class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

@GenerateMocks([MockNumberTriviaRepository])
void main() {
  late GetConcreteNumberTrivia usecase;
  late MockMockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockMockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: 'test', number: tNumber);

  test('should get trivia for the number from the repository', () async {
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
        .thenAnswer((_) async => const Right(tNumberTrivia));

    final result = await usecase.execute(number: tNumber);  

    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
