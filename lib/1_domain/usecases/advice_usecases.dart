import 'package:advicer/1_domain/entities/advice_entity.dart';

class AdviceUsecases {
  Future<AdviceEntity> getAdvice() async {
    //Call a repository to get the data i.e. failure  or data
    //Proceed with business logic (manipulate the data)
    await Future.delayed(const Duration(seconds: 3), () {});
    return AdviceEntity(advice: 'Fake Advice to test bloc', id: 1);
  }
}
