class ErrorModel {
  final String message;
  final String? code;

  ErrorModel({required this.message, required this.code});
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json['message'],
       code: json['code'] ?? 'null');
  }
}
