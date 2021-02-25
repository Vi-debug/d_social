import 'package:d_social/newsfeed_screen/view_model_newsfeed.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsfeedScreen extends StatefulWidget {
  @override
  _NewsfeedScreenState createState() => _NewsfeedScreenState();
}

class _NewsfeedScreenState extends State<NewsfeedScreen> {
  var _refresherController = RefreshController(
    initialRefresh: false,
  );
  NewsfeedViewModel viewModel = NewsfeedViewModel();

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: SmartRefresher(
          enablePullDown: false,
          enablePullUp: true,
          controller: _refresherController,
          onLoading: _onloading,
          child: ListView.builder(
            itemCount: viewModel.listNewsfeedWidget.length,
            itemBuilder: (context, index) {
              return viewModel.listNewsfeedWidget[index];
            },
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    await viewModel.updateListNewsfeed();
    setState(() {});
  }

  Future<void> _onloading() async {
    setState(() {
      viewModel.updateListNewsfeed();
    });
    _refresherController.loadComplete();
  }
}
