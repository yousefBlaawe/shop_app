import 'package:shop_app_clean/core/error_model/error_model.dart';

class ServerException implements Exception
{
  final ErrorModel? errorModel;
  ServerException({required this.errorModel});
}
class LocalException implements Exception
{
  final String errorException;
  LocalException(this.errorException);
}