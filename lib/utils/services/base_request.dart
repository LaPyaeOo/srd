import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:srd_frame/utils/helpers/response_obj.dart';

enum ReqType{
  getType,
  postType
}

class BaseRequest{
  void getReq({@required String url,Map<String, dynamic>dataParameter, Function dataCallback, Function errorCallback})async{
    mainReq(ReqType.getType,url: url,dataParameter: dataParameter, dataCallback: dataCallback, errorCallback: errorCallback);
  }

  void postReq({@required String url,Map<String, dynamic>dataParameter,FormData formBody,Function dataCallback, Function errorCallback})async{
    mainReq(ReqType.postType, url: url,dataParameter: dataParameter,formData: formBody, dataCallback: dataCallback, errorCallback: errorCallback);
  }

  void mainReq(ReqType reqType,{@required String url, Map<String, dynamic>dataParameter, Function dataCallback, FormData formData, Function errorCallback})async{
    BaseOptions options = BaseOptions(connectTimeout: 50000, receiveTimeout: 3000);
    Dio dio = Dio(options);
    Response dioResp = Response();
    ReqType reqType;
    try{
      //GET Request
      if(reqType == ReqType.getType){
        if(dataParameter == null){
          dioResp = await dio.get(url);
        }
        else{
          dioResp = await dio.get(url, queryParameters: dataParameter,);
        }
      }
      //POST Request
      else if(reqType == ReqType.postType){
        if(dataParameter != null || formData != null){
          dioResp = await dio.post(url, data: dataParameter?? formData,);
        }else{
          dioResp = await dio.post(url);
        }
      }
      ResponseObj responseObj = ResponseObj();
      responseObj.data = 'loading';
      responseObj.msgState =MsgState.loading;
      //Data receive
      if(dioResp.statusCode == 200){
        responseObj.data = dioResp.data;
        responseObj.msgState = MsgState.data;
        dataCallback(responseObj);
      }
      //Error receive
      else{
        if(dioResp.statusCode == 404){
          responseObj.errorState = ErrorState.fileNotFoundError;
          responseObj.msgState = MsgState.error;
          errorCallback(responseObj);
        }
        else if(dioResp.statusCode == 422){
          responseObj.errorState = ErrorState.clientError;
          responseObj.msgState = MsgState.error;
          errorCallback(responseObj);
        }
        else if(dioResp.statusCode == 500){
          responseObj.errorState = ErrorState.serverError;
          responseObj.msgState = MsgState.error;
          errorCallback(responseObj);
        }
      }
    }catch(e){
      ResponseObj responseObj = ResponseObj();
      responseObj.errorState = ErrorState.fileNotFoundError;
      responseObj.msgState = MsgState.error;
      errorCallback(responseObj);
    }
  }
}