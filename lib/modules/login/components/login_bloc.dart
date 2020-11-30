import 'package:rxdart/rxdart.dart';
import 'package:srd_frame/constants/api_path.dart';
import 'package:srd_frame/utils/helpers/response_obj.dart';
import 'package:srd_frame/utils/services/base_request.dart';

class LoginBloc extends BaseRequest{
  PublishSubject loginController = PublishSubject();

  Stream loginStream ()=> loginController;

  loginReq(Map<String, dynamic> dataMap){
    postReq(url: LOGIN_URL, dataParameter: dataMap, dataCallback: (ResponseObj resObj){
      print (resObj.data);
    },errorCallback: (ResponseObj resObj){
      loginController.sink.add(resObj);
    }
    );
  }

  disposeBloc(){
    loginController.close();
  }
}