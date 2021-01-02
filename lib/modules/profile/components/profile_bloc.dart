import 'package:rxdart/rxdart.dart';
import 'package:srd_frame/constants/api_path.dart';
import 'package:srd_frame/utils/helpers/response_obj.dart';
import 'package:srd_frame/utils/services/base_request.dart';

class ProfileBloc extends BaseRequest{
  PublishSubject<ResponseObj> profileController = PublishSubject();
  Stream<ResponseObj>profileStream ()=> profileController.stream;

  profileReq()async{
    getReq(PROFILE_URL,dataCallback: (ResponseObj resp){
      print('Data =>=> ${resp.message}');
      profileController.sink.add(resp);
    },errorCallback: (ResponseObj resp){
      print('Error =>=> ${resp.message}');
      profileController.sink.add(resp);
    });
  }

  closeProfileReq(){
    profileController.close();
  }
}