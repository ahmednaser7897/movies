import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../erorr/extensions.dart';


abstract class BaseUseCase<T,Parameters> {
  Future<Either< T,Failure>> call(Parameters parameter);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}