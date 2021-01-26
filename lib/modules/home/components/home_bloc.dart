import 'package:rxdart/rxdart.dart';
import 'package:srd_frame/constants/api_path.dart';
import 'package:srd_frame/modules/home/components/home_category_object.dart';
import 'package:srd_frame/modules/home/components/home_post_object.dart';
import 'package:srd_frame/utils/helpers/null_checker.dart';
import 'package:srd_frame/utils/helpers/response_obj.dart';
import 'package:srd_frame/utils/services/base_request.dart';

class HomeBloc extends BaseRequest{
  PublishSubject<ResponseObj> homeCatController = PublishSubject();
  Stream<ResponseObj> homeCatStream ()=> homeCatController.stream;

  PublishSubject<ResponseObj> homePostController = PublishSubject();
  Stream<ResponseObj> homePostStream ()=> homePostController.stream;


  homeCategoryRequest(){
    getReq(CATEGORY_URL,dataCallback: (ResponseObj resObj){
      if(resObj.message == MsgState.data){
        resObj.data = HomeCatObj.fromJson(resObj.data).result;
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

  String nextPageUrl;
  homePostRequest(){
    getReq(PUBLIC_POST,dataCallback: (ResponseObj resp){
      if(resp.message == MsgState.data){
        print('This is RespData >>>> ${resp.data}');
        HomePostObj homePostObj = HomePostObj.fromJson(resp.data);
        print('This is homPostObj >>>>> ${homePostObj.success}');
        if(!NullEmptyChecker.checkVar(homePostObj.result.nextPageUrl)){
          nextPageUrl = homePostObj.result.nextPageUrl;
          resp.data = homePostObj.result.data;
          homePostController.sink.add(resp);
        }
      }
    },errorCallback: (ResponseObj errResp){
      errResp.data = HomePostObj.fromJson(errResp.data);
      homePostController.sink.add(errResp);
    });
  }

  loadMoreHomeRequest(){
    getReq(nextPageUrl,dataCallback: (ResponseObj resp){
      if(resp.message == MsgState.data){
        HomePostObj loadhomePostObj = HomePostObj.fromJson(resp.data);
        resp.data = loadhomePostObj.result.data;
        homePostController.sink.add(resp);
      }
    },errorCallback: (ResponseObj errResp){
      errResp.data = HomePostObj.fromJson(errResp.data);
      homePostController.sink.add(errResp);
    });
  }

  homeRqClose(){
    homeCatController.close();
    homePostController.close();
  }
}