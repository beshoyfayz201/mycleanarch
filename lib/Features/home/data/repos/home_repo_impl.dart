import 'package:bookly/Features/home/data/data_source/local/home_local_data_source.dart';
import 'package:dartz/dartz.dart';

import 'package:bookly/Features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRemoteDataSourceImpl homeRemoteDataSource;
  HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var bookList = homeLocalDataSource.fetchFeturedBooks();
      if (bookList.isNotEmpty) {
        return Right(bookList);
      }
      var res = await homeRemoteDataSource.fetchFeatured();
      return Right(res);
    } on DioException catch (e) {
            return Left(ServerFailure.fromDiorError(e));

    } catch (e) {
      return Left(ServerFailure('process failed '));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> booksList = homeLocalDataSource.fetchNewestBooks();
      if (booksList.isNotEmpty) {
        return Right(booksList);
      }
      booksList = await homeRemoteDataSource.fetchNewest();
      return Right(booksList);
    } on DioException catch (e) {
            return Left(ServerFailure.fromDiorError(e));

    } catch (e) {
      return Left(ServerFailure('process failed '));
    }
  }
}
