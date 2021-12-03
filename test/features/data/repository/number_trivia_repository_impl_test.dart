import 'package:flutter_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/datasource/number_trivia_local_datasource.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/datasource/number_trivia_remote_datasource.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/model/number_trivia_model.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/repository/number_trivia_repository_impl.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/entity/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'number_trivia_repository_impl_test.mocks.dart';

class MockNumberRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockNumberLocalDataSource extends Mock
    implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

@GenerateMocks([MockNetworkInfo])
void main() {
  late NumberTriviaRepositoryImpl repository;
  MockNumberLocalDataSource mockNumberLocalDataSource;
  MockNumberRemoteDataSource mockNumberRemoteDataSource;
  late MockMockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNumberRemoteDataSource = MockNumberRemoteDataSource();
    mockNumberLocalDataSource = MockNumberLocalDataSource();
    mockNetworkInfo = MockMockNetworkInfo();

    repository = NumberTriviaRepositoryImpl(
        remoteDataSource: mockNumberRemoteDataSource,
        localDataSource: mockNumberLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  group('getConcreteNumberTrivia', () {
    const tNumber = 1;
    const tNumberTriviaModel =
        NumberTrivialModel(text: 'Any text', number: tNumber);
    const NumberTrivia tNumberTrivia = tNumberTriviaModel;
    test(
      'should check if device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.getConcreteNumberTrivia(tNumber);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );
  });
}
