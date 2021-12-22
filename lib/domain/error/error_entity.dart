import 'package:equatable/equatable.dart';

abstract class ErrorEntity extends Equatable implements Exception {
  final Exception? originalException;
  final int? errorCode;
  final String? errorMessage;

  const ErrorEntity({this.originalException, this.errorCode, this.errorMessage});

  @override
  List<Object?> get props => [originalException, errorCode, errorMessage];
}
