import 'package:rxdart/rxdart.dart';
import 'package:srd_frame/constants/api_path.dart';
import 'package:srd_frame/modules/home/home_view.dart';
import 'package:srd_frame/utils/helpers/response_obj.dart';
import 'package:srd_frame/utils/services/base_request.dart';
import 'package:srd_frame/utils/services/shared_preferences.dart';

class LoginBloc extends BaseRequest{
  PublishSubject<ResponseObj>loginController = PublishSubject();

  Stream<ResponseObj>loginStream ()=> loginController;

  loginReq(Map<String, dynamic> dataMap){
    postReq(url: LOGIN_URL, dataParameter: dataMap, dataCallback: (ResponseObj resObj){
      print (resObj.data);
      SharedPrefService.setStringData(key: SharedPrefService.token, value: 'Bearer'+resObj.data['token']);
      loginController.sink.add(resObj);
    },errorCallback: (ResponseObj resObj){
      print(resObj);
      loginController.sink.add(resObj);
    }
    );
  }

  disposeBloc(){
    loginController.close();
  }
}