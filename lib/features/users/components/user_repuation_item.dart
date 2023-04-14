import 'package:flutter/material.dart';
import 'package:sof_users/utils/time_formatter.dart';

class UserReputationItem extends StatelessWidget {
  final String? reputationType;
  // final int? age;
  final int? change;
  final int? createAt;
  final int? postId;

  final GestureTapCallback? onTap;

  const UserReputationItem({
    Key? key,
    this.reputationType = "",
    this.change = 0,
    this.createAt = 0,
    this.postId = 0,
    this.onTap,
  }) : super(key: key);

  Widget _typeDecorator() {
    Color color;
    switch (reputationType) {
      case "post_upvoted":
        color = Colors.orange;
        break;
      case "post_unupvoted":
        color = Colors.grey;
        break;
      case "answer_accepted":
        color = Colors.green;
        break;
      case "answer_unaccepted":
        color = Colors.red;
        break;
      default:
        color = Colors.black;
    }
    return Row(
      children: [
        const Text(
          "Reputation Type: ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        Text(
          "$reputationType",
          style: TextStyle(color: color, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minVerticalPadding: 5,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _typeDecorator(),
          Text('Change: $change'),
          Text('Created At: ${TimeUtils.convert12Hour(createAt!)}'),
          Text('Post ID: $postId'),
        ],
      ),
    );
  }
}
