import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:advicer/1_domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceUsecases {
  final AdviceRepo adviceRepo;
  AdviceUsecases({required this.adviceRepo});

  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    // //Call a repository to get the data i.e. failure  or data
    // //Proceed with business logic (manipulate the data)
    // await Future.delayed(const Duration(seconds: 1), () {});
    // //return right(AdviceEntity(advice: 'Fake Advice to test', id: 1));
    // //call to repo went wrong or had logic error -> return failure
    // return left(CacheFailure());
    return adviceRepo.getAdviceFromDatasource();
  }
}
