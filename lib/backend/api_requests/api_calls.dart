import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class InvitationSendGridCall {
  static Future<ApiCallResponse> call({
    String? invitationId = '',
    String? invitedEmail = '',
    String? restaurantName = '',
    String? restaurantEmail = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'InvitationSendGridCall',
        'variables': {
          'invitationId': invitationId,
          'invitedEmail': invitedEmail,
          'restaurantName': restaurantName,
          'restaurantEmail': restaurantEmail,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class PrintTablesEmailCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? name = '',
    String? adress = '',
    String? locality = '',
    String? from = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PrintTablesEmailCall',
        'variables': {
          'userId': userId,
          'name': name,
          'adress': adress,
          'locality': locality,
          'from': from,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class FactureRestaurantCall {
  static Future<ApiCallResponse> call({
    String? orderId = '',
    int? date,
    double? subtotal,
    double? fraisSuppl,
    double? tips,
    double? discount,
    double? total,
    double? netTotal,
    String? emailTo = '',
    String? iban = '',
    String? beneficiaryName = '',
    String? beneficiaryAdress = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FactureRestaurantCall',
        'variables': {
          'orderId': orderId,
          'date': date,
          'subtotal': subtotal,
          'fraisSuppl': fraisSuppl,
          'tips': tips,
          'discount': discount,
          'total': total,
          'netTotal': netTotal,
          'emailTo': emailTo,
          'iban': iban,
          'beneficiaryName': beneficiaryName,
          'beneficiaryAdress': beneficiaryAdress,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class FactureStaffTipsCall {
  static Future<ApiCallResponse> call({
    String? orderId = '',
    int? date,
    String? storeName = '',
    double? tips,
    double? netTotal,
    String? beneficiaryName = '',
    String? beneficiaryAdress = '',
    String? beneficiaryIBAN = '',
    String? emailTo = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FactureStaffTipsCall',
        'variables': {
          'orderId': orderId,
          'date': date,
          'storeName': storeName,
          'tips': tips,
          'netTotal': netTotal,
          'beneficiaryName': beneficiaryName,
          'beneficiaryAdress': beneficiaryAdress,
          'beneficiaryIBAN': beneficiaryIBAN,
          'emailTo': emailTo,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ConfirmationPaymentToUsersCall {
  static Future<ApiCallResponse> call({
    String? orderId = '',
    String? transactionID = '',
    int? date,
    String? emailTo = '',
    String? storeName = '',
    double? subtotal,
    double? fraisSuppl,
    double? tips,
    double? discount,
    double? total,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ConfirmationPaymentToUsersCall',
        'variables': {
          'orderId': orderId,
          'transactionID': transactionID,
          'date': date,
          'emailTo': emailTo,
          'storeName': storeName,
          'subtotal': subtotal,
          'fraisSuppl': fraisSuppl,
          'tips': tips,
          'discount': discount,
          'total': total,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
