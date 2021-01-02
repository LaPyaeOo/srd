import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:srd_frame/constants/api_path.dart';
import 'package:srd_frame/utils/helpers/response_obj.dart';
import 'package:srd_frame/utils/services/base_request.dart';
import 'package:path/path.dart';

class RegisterBloc extends BaseRequest {
  PublishSubject<ResponseObj> registerController = PublishSubject();

  Stream<ResponseObj> registerStream() => registerController.stream;

  registerReq(Map<String, dynamic> mapPara, File profileImg) async{
    //Map<String, dynamic> mapPara = {};
    mapPara.addAll({
      'image': await MultipartFile.fromFile(profileImg.path,
          filename: basename(profileImg.path))
    });
    FormData form = FormData.fromMap(mapPara);
    postReq(
        REGISTER_URL,
        formBody: form,
        dataCallback: (ResponseObj dataResp) {
          dataResp.message = MsgState.data;
          registerController.sink.add(dataResp);
        },
        errorCallback: (ResponseObj errResp) {
          print(errResp);
          errResp.message = MsgState.error;
          registerController.sink.add(errResp);
        });
  }

  closeRegBloc() {
    registerController.close();
  }
}
