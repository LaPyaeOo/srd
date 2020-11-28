class ResponseObj{
  MessageState dataState;
  dynamic data;
  ResponseObj();
}
enum MessageState{
  loading,
  data,
  serverError,
  userError,
}
enum ErrorState{
  clientError,
  serverError,
  redirectError,
}