class ResponseObj{
  MsgState message;
  ErrorState errorState;
  dynamic data;
  ResponseObj({data,msgState,errorState});
}
enum MsgState{
  loading,
  data,
  error,
}
enum ErrorState{
  clientError,
  fileNotFoundError,
  serverError,
  redirectError,
}