class ApiResponse<T> {
  ApiStatus? status;
  T? data;
  String? message;

  ApiResponse.loading(this.message) : status = ApiStatus.loading;
  ApiResponse.completed(this.data) : status = ApiStatus.completed;
  ApiResponse.error(this.message) : status = ApiStatus.error;
  ApiResponse.none(this.message) : status = ApiStatus.none;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum ApiStatus { loading, completed, error, none }
