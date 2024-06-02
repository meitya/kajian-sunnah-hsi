import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  DataState(this.data, this.error);
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data, null);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(DioException error) : super(null, error);
}
 
//  The  DataState  class is an abstract class that has two subclasses:  DataSuccess and DataError .
//  The  DataSuccess  class is used when the data is successfully fetched, and the DataError class is used when an error occurs