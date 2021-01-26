import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:srd_frame/modules/home/components/home_bloc.dart';
import 'package:srd_frame/modules/home/components/home_post_object.dart';
import 'package:srd_frame/utils/helpers/response_obj.dart';
import 'package:srd_frame/widgets/post_widget.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  HomeBloc _homeBc;
  RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    _homeBc = HomeBloc();
    _homeBc.homePostRequest();
    _homeBc.homePostStream().listen((ResponseObj res) {
      if(res.message == MsgState.data){
        _refreshController.refreshCompleted();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: ResponseObj(message: MsgState.loading),
      stream: _homeBc.homePostStream(),
      builder: (context, snapshot) {
        ResponseObj received = snapshot.data;
        if (received.message == MsgState.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (received.message == MsgState.data) {
          print('=>=>=>=>=> ${received.data}');
          List<HomePostData> list = received.data;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmartRefresher(
                enablePullUp: true,
                // footer: CustomFooter(
                //   builder: (BuildContext context, LoadStatus mode){
                //     Widget body;
                //     if(mode == LoadStatus.idle){
                //       body = Text('pull up load');
                //     }
                //     else if(mode == LoadStatus.failed){
                //       body = Text("Load Failed!Click retry!");
                //     }
                //     else if(mode == LoadStatus.canLoading){
                //       body = Text("release to load more");
                //     }
                //     else{
                //       body = Text("No more Data");
                //     }
                //     return Container(
                //       height: 55.0,
                //       child: Center(child:body),
                //     );
                //   },
                // ),
                onRefresh: () {
                  _homeBc.homePostRequest();
                },
                onLoading: () async{
                  await Future.delayed(Duration(milliseconds: 1000));
                  _homeBc.loadMoreHomeRequest();
                  _refreshController.loadComplete();
                },
                controller: _refreshController,
                // child: ListView(
                //   padding: EdgeInsets.all(10),
                //     children: list.map((e) {
                //       Post(
                //         onTap: (){},
                //         image: e.image,
                //         postTitle: e.title,
                //         uploadDateTime: e.createdAt,
                //         postContent: e.description,
                //       );
                //     }).toList(),
                //   ),
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  shrinkWrap: false,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Post(
                      onTap: () {},
                      image: list[index].image,
                      postContent: list[index].description,
                      uploadDateTime: list[index].createdAt.split('T')[0],
                      postTitle: list[index].title,
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: Text('Something Wrong'),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _homeBc.homeRqClose();
    super.dispose();
  }
}

//    [
// Post(onTap: (){},postContent: 'Post content', postTitle: 'Post title',uploadDateTime: DateTime.now().toString(),),
// Post(onTap: (){},postContent: 'Post content', postTitle: 'Post title',uploadDateTime: DateTime.now().toString(),),
// Post(onTap: (){},postContent: 'Post content', postTitle: 'Post title',uploadDateTime: DateTime.now().toString(),),
//    ]
