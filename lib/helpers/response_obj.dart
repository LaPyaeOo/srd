class ResponseObj {
  dynamic data;
  MsgStat message;

  ResponseObj({this.data, this.message});
}

enum MsgStat {
  loading,
  data,
  serverError,
}
