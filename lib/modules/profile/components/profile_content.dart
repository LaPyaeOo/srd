import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srd_frame/config/size_config.dart';
import 'package:srd_frame/config/themes.dart';
import 'package:srd_frame/modules/login/login_view.dart';
import 'package:srd_frame/modules/profile/components/profile_bloc.dart';
import 'package:srd_frame/utils/helpers/response_obj.dart';
import 'package:srd_frame/widgets/post_widget.dart';
import 'package:srd_frame/widgets/styling_button_widget.dart';
import 'package:srd_frame/widgets/user_circular_avatar_widget.dart';

class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {

  ProfileBloc _profileBloc;

  @override
  void initState() {
    _profileBloc = ProfileBloc();
    _profileBloc.profileReq();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView(
        children: [
          //buildProfileField(),
          StreamBuilder<Object>(
      stream: _profileBloc.profileStream(),
        initialData: ResponseObj(message: MsgState.loading),
            builder: (context, snapshot) {
              ResponseObj resData = snapshot.data;
              print(resData.message);
              if(resData.message == MsgState.loading){
                return Center(
                  child: Container(
                      width: double.infinity,
                      height: getScreenHeightRation(250.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.1),
                        ),
                        color: custSecondaryColor.withOpacity(0.4),
                        //shape: BoxShape.circle,
                      ),
                      child: Center(child: CircularProgressIndicator())),
                );
              }
              else if(resData.message == MsgState.error){
                return Center(
                  child: Text('Something was wrong'),
                );
              }
              else{
                return buildProfileField();
              }
            }
          ),
          SizedBox(
            height: getScreenHeightRation(20.0),
          ),
          Text(
            'Your posts',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          Container(
            height: getScreenHeightRation(400.0),
            child: ListView(
              children: [
                Post(
                  onTap: () {},
                  postContent: 'Post content',
                  postTitle: 'Post title',
                  uploadDateTime: DateTime.now().toString(),
                ),
                Post(
                  onTap: () {},
                  postContent: 'Post content',
                  postTitle: 'Post title',
                  uploadDateTime: DateTime.now().toString(),
                ),
                Post(
                  onTap: () {},
                  postContent: 'Post content',
                  postTitle: 'Post title',
                  uploadDateTime: DateTime.now().toString(),
                ),
                Post(
                  onTap: () {},
                  postContent: 'Post content',
                  postTitle: 'Post title',
                  uploadDateTime: DateTime.now().toString(),
                ),
                Post(
                  onTap: () {},
                  postContent: 'Post content',
                  postTitle: 'Post title',
                  uploadDateTime: DateTime.now().toString(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildProfileField() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: getScreenHeightRation(250.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
          color: custSecondaryColor.withOpacity(0.4),
          //shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserCircularAvt(
              svgIcon: 'assets/icons/User.svg',
              statusTxt: '',
              onUploadPhoto: () {},
            ),
            SizedBox(
              height: getScreenHeightRation(5),
            ),
            Text(
              'Mg Mg \n \n mgmg@gmail.com',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getScreenHeightRation(20.0),),
            buildLogOutButton(),
          ],
        ),
      ),
    );
  }
  Widget buildLogOutButton(){
    return Container(
      width: getScreenWidthRation(120.0),
      height: getScreenHeightRation(40.0),
      child: StylingButton(
        onPress: (){
          logout();
        },
        text: 'Logout',
        color: custPrimaryColor.withOpacity(0.4),
      ),
    );
  }

  logout()async{
      final pref = await SharedPreferences.getInstance();
      await pref.clear();
    //Navigator.pushNamed(context, LoginView.routeName);
      Navigator.of(context).pushNamedAndRemoveUntil(LoginView.routeName, (route) => false);
  }

  @override
  void dispose() {
    _profileBloc.closeProfileReq();
    super.dispose();
  }
}
