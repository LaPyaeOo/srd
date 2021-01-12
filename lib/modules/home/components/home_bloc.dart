import 'package:rxdart/rxdart.dart';
import 'package:srd_frame/constants/api_path.dart';
import 'package:srd_frame/modules/home/components/home_category_object.dart';
import 'package:srd_frame/utils/helpers/response_obj.dart';
import 'package:srd_frame/utils/services/base_request.dart';

class HomeBloc extends BaseRequest{
  PublishSubject<ResponseObj> homeCatController = PublishSubject();
  Stream<ResponseObj> homeStream ()=> homeCatController.stream;

  homeCategoryRequest(){
    getReq(CATEGORY_URL,dataCallback: (ResponseObj resObj){
      if(resObj.message == MsgState.data){
        resObj.data = HomeObj.fromJson(resObj.data).result;
        resObj.message = MsgState.data;
        homeCatController.sink.add(resObj);
      }
    },
    errorCallback: (ResponseObj errResObj){
      errResObj.data = errResObj;
      errResObj.message = MsgState.error;
      homeCatController.sink.add(errResObj);
    }
    );
  }
  homeCategoryRqClose(){
    homeCatController.close();
  }
}