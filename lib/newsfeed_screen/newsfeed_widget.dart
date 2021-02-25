import 'package:d_social/model/newsfeed.dart';
import 'package:flutter/material.dart';

class NewsfeedWidget extends StatelessWidget {
  final Newsfeed newsfeed;

  const NewsfeedWidget({Key key, this.newsfeed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(2),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 2)]),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                newsfeed.userImageUrl,
                width: 24,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(newsfeed.userName),
                  Text(newsfeed.createdTime),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(newsfeed.content),
          const SizedBox(height: 10),
          newsfeed.imageUrl != ""
              ? Image.network(
                  newsfeed.imageUrl,
                )
              : Container(),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.library_books),
              Text('${newsfeed.likeCount}'),
              const SizedBox(width: 10),
              Icon(Icons.comment),
              Text('${newsfeed.commentCount}'),
            ],
          )
        ],
      ),
    );
  }
}
