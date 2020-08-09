import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project_boilerplate/core/api/api_error.dart';
import 'package:flutter_project_boilerplate/core/api/response/response_object.dart';
import 'package:flutter_project_boilerplate/core/exceptions/api_exception.dart';
import 'package:flutter_project_boilerplate/core/exceptions/unexpected_exception.dart';
import 'package:flutter_project_boilerplate/core/logging/logger.dart';
import 'package:flutter_project_boilerplate/core/utils/constants.dart';
import 'api_response.dart';

// TODO: INJECT THIS
final DIO = Dio();

class ApiClient {
  final String _baseUrl;
  final String apiKey;
  final Logger logger;

  ApiClient(this.apiKey, this._baseUrl, this.logger);

  // Http requests

  // Performs a GET request to the given url, returning a Future with the ApiResponse obtained
  // token should be injected by respective client manually by getting it from `SessionController` instance
  Future<ResponseObject> get({
    @required String endpoint,
    @required ResponseObject Function(Map<String,dynamic>) serializer,
    Map<String, String> queryParams,
    String preferredUrl,
    Map headers,
    String token
  }) async {
    final String url = buildUrl(endpoint: endpoint, queryParams: queryParams, preferredUrl: preferredUrl);
    Map requestHeaders = buildHeaders(token: token);
    if (headers != null) {
      requestHeaders.addAll(headers);
    }

    try {
      final response = await DIO.get(url, options: Options(headers: requestHeaders));

      ApiResponse apiResponse = handleResponse(response);

      return serializer(apiResponse.body);
    } on ApiException catch (ex) {
      // If the exception caught is an ApiException, then it isn't actually unexpected. We just throw it again
      logger.logVerbose('Unexepected exception obtained with request GET ' +
          endpoint +
          '\nException: ' +
          ex.toString());
      throw ex;
    } on DioError catch (ex) {
      logger.logVerbose('Unexepected exception obtained with request GET ' +
          endpoint +
          '\nException: ' +
          ex.toString());

      handleError(ex.response);
      throw ApiException(
          ApiError(detail: ex.error.toString()),
          ex.response.statusCode);
    } catch (ex) {
      logger.logVerbose('Unexepected exception obtained with request GET ' +
          endpoint +
          '\nException: ' +
          ex.toString());
      throw CustomException(
          "Something is wrong with your request!", ex, ex.response.statusCode);
    }
  }

  // Performs a GET request to the given url, returning a Future with the ApiResponse obtained
  // token should be injected by respective client manually by getting it from `SessionController` instance
  Future<List<T>> getListWithoutPagination<T>({
    @required String endpoint,
    @required T Function(Map<String,dynamic>) serializer,
    Map<String, String> queryParams,
    String preferredUrl,
    Map headers,
    String token
  }) async {
    final String url = buildUrl(endpoint: endpoint, queryParams: queryParams, preferredUrl: preferredUrl);
    Map requestHeaders = buildHeaders(token: token);
    if (headers != null) {
      requestHeaders.addAll(headers);
    }

    try {
      final response = await DIO.get(url, options: Options(headers: requestHeaders));

      List<T> ret = [];
      response.data.forEach(
              (data) {
            ret.add(serializer(data));
          }
      );

      return ret;
    } on ApiException catch (ex) {
      // If the exception caught is an ApiException, then it isn't actually unexpected. We just throw it again
      throw ex;
    } on DioError catch (ex) {
      logger.logVerbose('Unexepected exception obtained with request POST ' +
          endpoint +
          '\nException: ' +
          ex.toString());

      handleError(ex.response);
      throw CustomException(
          "Something is wrong with your request", ex, ex.response.statusCode);
    } catch (ex) {
      logger.logVerbose('Unexepected exception obtained with request GET ' +
          endpoint +
          '\nException: ' +
          ex.toString());
      throw CustomException(
          "Something is wrong with your request", ex, ex.response.statusCode);
    }
  }

  // Performs a GET request to the given url, returning a Future with the ApiResponse obtained
  // token should be injected by respective client manually by getting it from `SessionController` instance
  Future<List<T>> getList<T>({
    @required String endpoint,
    @required T Function(Map<String,dynamic>) serializer,
    Map<String, String> queryParams,
    String preferredUrl,
    Map headers,
    String token
  }) async {
    final String url = buildUrl(endpoint: endpoint, queryParams: queryParams, preferredUrl: preferredUrl);
    Map requestHeaders = buildHeaders(token: token);
    if (headers != null) {
      requestHeaders.addAll(headers);
    }

    try {
      final response = await DIO.get(url, options: Options(headers: requestHeaders));

      ApiResponseList apiResponseList = handleResponseList(response);

      List<T> ret = [];
      apiResponseList.body.forEach(
          (data) {
            ret.add(serializer(data));
          }
      );

      return ret;
    } on ApiException catch (ex) {
      // If the exception caught is an ApiException, then it isn't actually unexpected. We just throw it again
      throw ex;
    } on DioError catch (ex) {
      logger.logVerbose('Unexepected exception obtained with request POST ' +
          endpoint +
          '\nException: ' +
          ex.toString());

      handleError(ex.response);
      throw CustomException(
          "Something is wrong with your request", ex, ex.response.statusCode);
    } catch (ex) {
      logger.logVerbose('Unexepected exception obtained with request GET ' +
          endpoint +
          '\nException: ' +
          ex.toString());
      throw CustomException(
          "Something is wrong with your request", ex, ex.response.statusCode);
    }
  }

  // Performs a POST request to the given url with the provided headers and body, returning a Future with the ApiResponse obtained
  // token should be injected by respective client manually by getting it from `SessionController` instance
  Future<ResponseObject> post({
    @required String endpoint,
    @required ResponseObject Function(Map<String,dynamic>) serializer,
    Map body,
    Map headers,
    String token,
    String preferredUrl
  }) async {
    final String url = buildUrl(endpoint: endpoint, preferredUrl: preferredUrl);
    Map requestHeaders = buildHeaders(token: token);
    if (headers != null) {
      requestHeaders.addAll(headers);
    }
    try {
      print(body);

      final Response response = await DIO.post(
          url,
          options: Options(headers: requestHeaders),
          data: body,
      );

      print(response.data.toString());

      ApiResponse apiResponse = handleResponse(response);

      return serializer(apiResponse.body);
    } on ApiException catch (ex) {
      // If the exception caught is an ApiException, then it isn't actually unexpected. We just throw it again
      throw ex;
    } on DioError catch (ex) {
      logger.logVerbose('Unexepected exception obtained with request POST ' +
          endpoint +
          '\nException: ' +
          ex.toString());

      handleError(ex.response);
      throw CustomException(
          "Something is wrong with your request", ex, ex?.response?.statusCode ?? -1);
    } catch (ex) {
      logger.logVerbose('Unexepected exception obtained with request POST ' +
          endpoint +
          '\nException: ' +
          ex.toString());
      throw CustomException(
          "Something is wrong with your request", ex, ex.response.statusCode);
    }

  }

  Future<ResponseObject> patch({
    @required String endpoint,
    @required ResponseObject Function(Map<String,dynamic>) serializer,
    FormData body,
    Map headers,
    String token,
    String preferredUrl
  }) async {
    final String url = buildUrl(endpoint: endpoint, preferredUrl: preferredUrl);
    Map requestHeaders = buildHeaders(token: token);
    if (headers != null) {
      requestHeaders.addAll(headers);
    }
    try {
      final Response response = await DIO.patch(
        url,
        options: Options(headers: requestHeaders),
        data: body,
      );

      ApiResponse apiResponse = handleResponse(response);

      return serializer(apiResponse.body);
    } on ApiException catch (ex) {
      // If the exception caught is an ApiException, then it isn't actually unexpected. We just throw it again
      throw ex;
    } on DioError catch (ex) {
      logger.logVerbose('Unexepected exception obtained with request PATCH ' +
          endpoint +
          '\nException: ' +
          ex.toString());

      handleError(ex.response);
      throw CustomException(
          "Something is wrong with your request", ex, ex.response.statusCode);
    } catch (ex) {
      logger.logVerbose('Unexepected exception obtained with request PATCH ' +
          endpoint +
          '\nException: ' +
          ex.toString());

      throw CustomException(
          "Something is wrong with your request", ex, ex.response.statusCode);
    }

  }

  // Process a Response and returns an ApiResponse with the corresponding status code and body.
  // It works for either successful and failing responses, and the status code should be used later to understand whether the response succeeded or not
  // In the case of obtaining an invalid body (i.e. an XML that would fail when parsed as a JSON), it will throw the corresponding exception
  ApiResponse handleResponse(Response response) {
    logger.logVerbose('Response for ' +
        response.request.path +
        '\nStatus code: ' +
        response.statusCode.toString() +
        '\nBody:\n' +
        response.data.toString());


    Map<String, dynamic> body = Map<String, dynamic>();
    if (response.data.isNotEmpty) {
      body = response.data;
    }

    final apiResponse = ApiResponse(response.statusCode, body);

    if (apiResponse.wasSuccessful()) {
      return apiResponse;
    } else {
      handleError(response);
      ApiError error = ApiError.fromJson(apiResponse.body);
      throw ApiException(error, apiResponse.statusCode);
    }
  }

  // Process a Response and returns an ApiResponse with the corresponding status code and body.
  // It works for either successful and failing responses, and the status code should be used later to understand whether the response succeeded or not
  // In the case of obtaining an invalid body (i.e. an XML that would fail when parsed as a JSON), it will throw the corresponding exception
  ApiResponseList handleResponseList(Response response) {
    logger.logVerbose('Response for ' +
        response.request.path +
        '\nStatus code: ' +
        response.statusCode.toString() +
        '\nBody:\n' +
        response.data.toString());
    final respData = response.data;
    int count = respData['count'];
    String next = respData['next'];
    String previous = respData['previous'];

    List<dynamic> data = respData['results'];

    List<Map<String, dynamic>> body = [];
    if (data != null) {
      data.forEach((dataJson) {
        Map<String, dynamic> json = dataJson;
        body.add(json);
      });
    }

    final apiResponse = ApiResponseList(
        statusCode: response.statusCode,
        count: count,
        next: next,
        previous: previous,
        body: body
    );

    if (apiResponse.wasSuccessful()) {
      return apiResponse;
    } else {
      ApiError error = ApiError.fromJson(response.data);
      throw ApiException(error, apiResponse.statusCode);
    }
  }

  // Process a Response and returns an ApiResponse with the corresponding status code and body.
  // It works for either successful and failing responses, and the status code should be used later to understand whether the response succeeded or not
  // In the case of obtaining an invalid body (i.e. an XML that would fail when parsed as a JSON), it will throw the corresponding exception
  ApiResponseList handleResponseListWithoutPagination(Response response) {
    logger.logVerbose('Response for ' +
        response.request.path +
        '\nStatus code: ' +
        response.statusCode.toString() +
        '\nBody:\n' +
        response.data.toString());
    final respData = response.data;

    final apiResponse = ApiResponseList(
        statusCode: response.statusCode,
        count: null,
        next: null,
        previous: null,
        body: respData
    );

    if (apiResponse.wasSuccessful()) {
      return apiResponse;
    } else {
      ApiError error = ApiError.fromJson(response.data);
      throw ApiException(error, apiResponse.statusCode);
    }
  }

  // Creates a Map with the necessary headers for any request sent to our API
  Map buildHeaders({
    String token
  }) {
    Map<String, String> headers = Map();

    headers[Constants.apiKeyHeader] = apiKey;
    headers[Constants.contentTypeHeader] = "application/json";

    print("token is $token");
    if (token != null) {
      headers[Constants.authorizationHeader] = "Bearer $token";
    }

    return headers;
  }

  String buildUrl(
      {@required String endpoint, Map<String, String> queryParams, String preferredUrl}) {
    var apiUri = preferredUrl != null ? Uri.parse(preferredUrl) : Uri.parse(_baseUrl);
    final apiPath = apiUri.path+"/"+endpoint;
    final uri = Uri(
      scheme: apiUri.scheme,
      host: apiUri.host,
      path: apiPath,
      queryParameters: queryParams
    ).toString();
    return uri;
  }

  void handleError(Response response) {}

}
