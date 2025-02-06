import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Time out ');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Time out ');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recieve Time out ');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadRespone(
            dioException.response!.statusCode!, dioException.response);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Network Connection');
        }
        return ServerFailure('UnExpected Error. please, try agian');
      default:
        return ServerFailure('UnExpected Error. please, try agian');
    }
  }

  factory ServerFailure.fromBadRespone(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps, There was an error. please, try agian later');
    }
  }
}
