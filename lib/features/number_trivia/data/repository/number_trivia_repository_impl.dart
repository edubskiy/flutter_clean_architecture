import 'package:flutter_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/datasource/number_trivia_local_datasource.dart';
import 'package:flutter_clean_architecture/features/number_trivia/data/datasource/number_trivia_remote_datasource.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/entity/number_trivia.dart';
import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/repository/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) async {
    networkInfo.isConnected;
    return const Right(NumberTrivia(number: 1, text: 'any'));
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw UnimplementedError();
  }
}
