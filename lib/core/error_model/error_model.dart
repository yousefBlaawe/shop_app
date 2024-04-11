import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable
{
  final int? statusCode;
  final String? statusMessage;
  final bool? success;
  const ErrorModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,

  });
  factory ErrorModel.fromJason(Map<String,dynamic>?jason)
  {
    return ErrorModel(
        statusCode: jason?['status_code'],
        statusMessage:jason?['status_message'],
        success: jason? ['success']);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>[statusCode,statusMessage,success];

}