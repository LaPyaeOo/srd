import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:srd_frame/utils/helpers/response_obj.dart';
import 'package:srd_frame/utils/services/shared_preferences.dart';

enum ReqType{
  getType,
  postType
}

class BaseRequest{
  void getReq(String url,{Map<String, String>dataParameter, Function dataCallback, Function errorCallback})async{
    mainReq(ReqType.getType,url: url,dataParameter: dataParameter, dataCallback: dataCallback, errorCallback: errorCallback);
  }

  void postReq(String url,{Map<String, String>dataParameter,FormData formBody,Function dataCallback, Function errorCallback})async{
    mainReq(ReqType.postType, url: url,dataParameter: dataParameter,formData: formBody, dataCallback: dataCallback, errorCallback: errorCallback);
  }

  void mainReq(ReqType reqType,{@required String url, Map<String, String>dataParameter, FormData formData, Function dataCallback, Function errorCallback})async{
    String token = await SharedPrefService.getStringData(key: SharedPrefService.token);
    BaseOptions options = BaseOptions();
    options.connectTimeout = 10000;
    options.receiveTimeout = 10000;
    options.headers = {
      'Authorization': token,
    };
    Dio dio = new Dio(options);
    Response dioResp;
    try{
      //GET Request
      if(reqType == ReqType.getType){
        if(dataParameter == null){
          dioResp = await dio.get(url);
          print('Response G1 $dioResp');
        }
        else{
          dioResp = await dio.get(url, queryParameters: dataParameter,);
          print('Response G2 $dioResp');
        }
      }
      //POST Request
      else{
        if(dataParameter != null || formData != null){
          dioResp = await dio.post(url, data: dataParameter?? formData,);
          print('Response P1 $dioResp');
        }else{
          dioResp = await dio.post(url);
          print('Response P1 $dioResp');
        }
      }
      ResponseObj responseObj = ResponseObj();
      responseObj.data = 'loading';
      responseObj.message =MsgState.loading;
      //Data receive
      if(dioResp.statusCode == 200){
        if(dioResp.data['success'] == true){
          responseObj.message = MsgState.data;
          responseObj.data = dioResp.data['result'];
          print('Data State 200 =>=>=> ${responseObj.data}');
          dataCallback(responseObj);
        }
        else{
          responseObj.message = MsgState.error;
          responseObj.errorState = ErrorState.clientError;
          print('Error State 200 =>=>=> ${responseObj.data}');
          errorCallback(responseObj);
        }
      }
      //Error receive
      else{
        if(dioResp.statusCode == 404){
          responseObj.errorState = ErrorState.fileNotFoundError;
          responseObj.message = MsgState.error;
          print('Error State =>=>=> 404');
          errorCallback(responseObj);
        }
        else if(dioResp.statusCode == 422){
          responseObj.errorState = ErrorState.clientError;
          responseObj.message = MsgState.error;
          print('Error State =>=>=> 422');
          errorCallback(responseObj);
        }
        else if(dioResp.statusCode == 500){
          responseObj.errorState = ErrorState.serverError;
          responseObj.message = MsgState.error;
          print('Error State =>=>=> 500');
          errorCallback(responseObj);
        }
      }
    }catch(e){
      ResponseObj responseObj = ResponseObj();
      responseObj.errorState = ErrorState.fileNotFoundError;
      responseObj.message = MsgState.error;
      print('Estate =>=>=> $e');
      errorCallback(responseObj);
    }
  }
}


// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:srd_frame/utils/helpers/response_obj.dart';
// import 'package:srd_frame/utils/services/shared_preferences.dart';
//
//
// enum RequestType{
//   Get,
//   Post
// }
//
//
//
// class BaseNetwork{
//
//
//   void getReq(String url,{Map<String,String> params,Function onDataCallBack,Function errorCallBack})async{
//     requestData(RequestType.Get, url: url,params: params,onDataCallBack: onDataCallBack,errorCallBack: errorCallBack);
//
//   }
//   void postReq(String url,{Map<String,String> params,FormData fd,Function onDataCallBack,Function errorCallBack})async{
//
//     requestData(RequestType.Post, url: url,params: params,fd: fd,onDataCallBack: onDataCallBack,errorCallBack: errorCallBack);
//
//   }
//
//
//   void  requestData(RequestType rt,{@required String url,Map<String,String> params,FormData fd,Function onDataCallBack,Function errorCallBack})async{
//
//     BaseOptions options=BaseOptions();
//     options.connectTimeout=10000;
//     options.receiveTimeout=10000;
//
//     String token=await SharedPrefService.getStringData(key: SharedPrefService.token);
//     options.headers={
//       'Authorization': token,
//     };
//
//
//     Dio dio=new Dio(options);
//
//     try {
//       Response response;
//       if (rt == RequestType.Get) {
//         if (params == null) {
//           response = await dio.get(url);
//         } else {
//           response = await dio.get(url, queryParameters: params);
//         }
//       } else {
//         if (params != null || fd != null) {
//           response = await dio.post(url, data: fd ?? params);
//         } else {
//           response = await dio.post(url);
//         }
//       }
//
//       int statusCode = response.statusCode;
//
//       ResponseObj respOb = new ResponseObj(); //data,message,err
//       print('*************\n');
//       print(url);
//       print(statusCode);
//       print(response.data);
//       print('*************\n');
//
//       if (statusCode == 200) {
//         //data
//         if(response.data['success']==true) {
//           respOb.data = response.data;
//           respOb.message = MsgState.data;
//           onDataCallBack(respOb);
//         }else{
//           respOb.data=response.data['result'];
//           respOb.message=MsgState.error;
//           respOb.errorState=ErrorState.clientError;
//           errorCallBack(respOb);
//         }
//
//       } else {
//         //error
//         respOb.errorState = ErrorState.serverError;
//         respOb.message = MsgState.error;
//         errorCallBack(respOb);
//       }
//     }catch(e){
//       ResponseObj respOb = new ResponseObj(); //data,message,err
//
//       respOb.errorState = ErrorState.serverError;
//       respOb.message = MsgState.error;
//       errorCallBack(respOb);
//     }
//
//   }
//}