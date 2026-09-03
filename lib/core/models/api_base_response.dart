class ApiBaseResponse<T> {
  ApiBaseResponse({
    this.code,
    this.message,
    this.messageKh,
    this.data,
  });

  factory ApiBaseResponse.fromJson(
      dynamic json,
      T Function(dynamic json)? fromJsonT,
      ) {
    return ApiBaseResponse<T>(
      code: json['code'],
      message: json['message'],
      messageKh: json['messageKh'],
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data'])
          : json['data'] as T?,
    );
  }

  String? code;
  String? message;
  String? messageKh;
  T? data;

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'messageKh': messageKh,
      'data': data,
    };
  }
}