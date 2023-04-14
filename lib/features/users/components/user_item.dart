import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String? name;
  // final int? age;
  final int? userID;
  final String? location;
  final String? avartarUrl;
  final int? reputation;

  final bool bookmarkAdded;

  final GestureTapCallback? onTap;
  final VoidCallback? bookmarkOnPressed;

  const UserItem(
      {Key? key,
      this.name = "Unknow",
      this.userID = 0,
      this.location = "",
      this.avartarUrl = "",
      this.bookmarkAdded = false,
      this.reputation = 0,
      this.onTap,
      this.bookmarkOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minVerticalPadding: 5,
      leading: CircleAvatar(
        radius: 30.0,
        backgroundImage: NetworkImage(
          avartarUrl!,
        ),
      ),
      title: Text(
        name!,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('User ID: $userID'),
          Text('Reputation: $reputation'),
          Text('Location: $location'),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          bookmarkAdded ? Icons.bookmark_added : Icons.bookmark_add,
          color: bookmarkAdded ? Colors.blue : Colors.grey,
        ),
        onPressed: bookmarkOnPressed,
      ),
    );
  }
}
