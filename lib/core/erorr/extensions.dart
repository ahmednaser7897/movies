
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/network/erorr_messege.dart';

class Failure extends Equatable{
  final String messege;

  const Failure(this.messege);
  
  @override
  
  List<Object?> get props => [messege];
}

class ServerFailure extends Failure{
  const ServerFailure(super.messege);

}
class ServerExtension implements Exception{
  final ErorrMessegeModel erorrMessegeModel;

   ServerExtension(this.erorrMessegeModel);
}