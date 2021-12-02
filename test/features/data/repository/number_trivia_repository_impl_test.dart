import 'package:flutter_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/datasource/number_trivia_local_datasource.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/datasource/number_trivia_remote_datasource.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/repository/number_trivia_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockNumberLocalDataSource extends Mock
    implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late NumberTriviaRepositoryImpl repository;
  MockNumberLocalDataSource mockNumberLocalDataSource;
  MockNumberRemoteDataSource mockNumberRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNumberRemoteDataSource = MockNumberRemoteDataSource();
    mockNumberLocalDataSource = MockNumberLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = NumberTriviaRepositoryImpl(
        remoteDataSource: mockNumberRemoteDataSource,
        localDataSource: mockNumberLocalDataSource,
        networkInfo: mockNetworkInfo);
  });
}
