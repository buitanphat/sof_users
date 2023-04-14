import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sof_users/features/users/components/user_item.dart';
import 'package:sof_users/features/users/modal/screen_agrs.dart';
import 'package:sof_users/features/users/provider/sof_users_provider.dart';

class SOFUsersScreen extends StatefulWidget {
  const SOFUsersScreen({super.key});
  @override
  State<SOFUsersScreen> createState() => _SOFUsersScreenState();
}

class _SOFUsersScreenState extends State<SOFUsersScreen> {
  static int page = 1;
  bool isLoading = false;
  late SOFUsersProvider sofUserProvider;
  late ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    super.initState();
    sofUserProvider = Provider.of<SOFUsersProvider>(context, listen: false);
    sofUserProvider.loadLocalBookmark();
    sofUserProvider.fetchUsersList(page);
    page++;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    sofUserProvider.clear();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _getMoreData(page);
    }
  }

  void _getMoreData(int index) async {
    if (sofUserProvider.isFilterBookmark) return;
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      await sofUserProvider.fetchUsersList(page);
      setState(() {
        isLoading = false;
        page++;
      });
    }
  }

  Widget _buildProgressIndicator() {
    if (sofUserProvider.isFilterBookmark) return Container();
    return const Padding(
      padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 30),
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            color: Colors.grey,
            backgroundColor: Colors.blueAccent,
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    return Scrollbar(
      controller: _scrollController,
      child: Consumer<SOFUsersProvider>(builder: (context, provider, child) {
        final userList = provider.getCurrentSOFUserList();
        final bookmarkAddedMap = provider.bookmarkAddedMap;

        return ListView.separated(
          itemCount: userList.length + 1,
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          itemBuilder: (BuildContext context, int index) {
            if (index == userList.length) {
              return _buildProgressIndicator();
            } else {
              final userModel = userList[index];
              return UserItem(
                name: userModel.displayName,
                avartarUrl: userModel.profileImage,
                reputation: userModel.reputation,
                location: userModel.location,
                userID: userModel.userId,
                bookmarkAdded:
                    bookmarkAddedMap.containsKey(userModel.userId.toString()),
                onTap: () {
                  Navigator.pushNamed(context, '/userDetail',
                      arguments: ScreenArguments(
                        userId: userModel.userId,
                      ));
                },
                bookmarkOnPressed: () {
                  sofUserProvider.bookmarkUserById(userModel.userId.toString());
                },
              );
            }
          },
          controller: _scrollController,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SOF User List"),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.collections_bookmark),
                onPressed: () {
                  sofUserProvider.filterBookmarkAdded();
                }),
          ],
        ),
        body: Container(
          child: _buildList(),
        ));
  }
}
