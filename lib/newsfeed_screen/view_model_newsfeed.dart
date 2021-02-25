import 'package:d_social/api.dart';
import 'package:d_social/newsfeed_screen/newsfeed_widget.dart';

class NewsfeedViewModel {
  var _index;
  List<NewsfeedWidget> listNewsfeedWidget;

  NewsfeedViewModel() {
    _index = 1;
    listNewsfeedWidget = [];
  }

  Future<void> updateListNewsfeed() async {
    var listNewsfeed = await Api.fetchListNewsfeed(_index++);
    if (listNewsfeed != null) {
      for (var i = 0; i < listNewsfeed.length; i++) {
        listNewsfeedWidget.add(NewsfeedWidget(
          newsfeed: listNewsfeed[i],
        ));
      }
    }
  }
}
