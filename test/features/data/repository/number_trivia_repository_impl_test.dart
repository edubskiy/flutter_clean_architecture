import 'package:dartz/dartz.dart';
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

@GenerateMocks([MockNetworkInfo, MockNumberLocalDataSource, MockNumberRemoteDataSource])
void main() {
  late NumberTriviaRepositoryImpl repository;
  late MockMockNumberLocalDataSource mockNumberLocalDataSource;
  late MockMockNumberRemoteDataSource mockNumberRemoteDataSource;
  late MockMockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNumberRemoteDataSource = MockMockNumberRemoteDataSource();
    mockNumberLocalDataSource = MockMockNumberLocalDataSource();
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
        // arran
        when(mockNumberRemoteDataSource.getConcreteNumberTrivia(tNumber))
              .thenAnswer((realInvocation) async => tNumberTriviaModel);
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.getConcreteNumberTrivia(tNumber);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockNumberRemoteDataSource.getConcreteNumberTrivia(tNumber))
              .thenAnswer((realInvocation) async => tNumberTriviaModel);
          // act
          final result = await repository.getConcreteNumberTrivia(tNumber);
          // assert
          verify(mockNumberRemoteDataSource.getConcreteNumberTrivia(tNumber));
          expect(result, equals(const Right(tNumberTrivia)));
        },
      );
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => false);
      });
    });
  });
}
