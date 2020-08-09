class ApiError {
  final String detail;

  ApiError({this.detail});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(detail: json['detail']);
  }
}
