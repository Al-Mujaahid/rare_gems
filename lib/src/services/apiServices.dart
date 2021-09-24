import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rare_gem/src/models/core/ApiResponse.dart';
import 'package:rare_gem/src/services/index.dart';
import 'package:rare_gem/utils/constants/constants.dart';

class ApiService {
  static final _apiService = ApiService.createInstance();

  ApiService.createInstance();

  Dio dio = Dio();

  factory ApiService() {
    _apiService.dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      error: true,
      requestHeader: true,
      compact: true,
    ));
    return _apiService;
  }

  Future<ApiResponse> makePostRequest(url, data, headers) async {
    try {
      return await dio
          .post(url,
              data: FormData.fromMap(data),
              options: Options(
                  headers: headers == null ? await _getHeader() : headers,
                  responseType: ResponseType.json))
          .then((value) {
        return ApiResponse.fromJSON(
            {'status': true, 'data': value.data, 'message': 'success'});
      });
    } on DioError catch (error) {
      // print(error.error);
      if (error.response == null) {
        return ApiResponse.fromJSON({
          'status': false,
          'data': null,
          'message': 'Internet connection error'
        });
      }
      return ApiResponse.fromJSON({
        'status': false,
        'data': null,
        'message':
            '${error.response!.data['error'] ?? error.response!.data['message']}'
      });
    } catch (error) {
      return ApiResponse.fromJSON({
        'status': false,
        'data': null,
        'message': 'Error: please try again'
      });
    }
  }

  Future<ApiResponse> makeGetRequest(url, headers) async {
    try {
      return await dio
          .get(url,
              options: Options(
                  headers: headers == null ? await _getHeader() : headers,
                  responseType: ResponseType.json))
          .then((value) {
        return ApiResponse.fromJSON(
            {'status': true, 'data': value.data, 'message': 'success'});
      });
    } on DioError catch (error) {
      // print(error.type);
      if (error.response == null) {
        return ApiResponse.fromJSON({
          'status': false,
          'data': null,
          'message': 'Internet connection error'
        });
      }
      return ApiResponse.fromJSON({
        'status': false,
        'data': null,
        'message':
            '${error.response!.data['error'] ?? error.response!.data['message']}'
      });
    } catch (error) {
      return ApiResponse.fromJSON({
        'status': false,
        'data': null,
        'message': 'Error: please try again'
      });
    }
  }

  Future _getHeader() async {
    var token = await localStorageService.get(USER_BOX, TOKEN_KEY);
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
  }
}
