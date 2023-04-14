import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sof_users/features/users/components/user_repuation_item.dart';
import 'package:sof_users/features/users/modal/screen_agrs.dart';
import 'package:sof_users/features/users/provider/sof_user_reputation_provider.dart';

class SOFUserDetailScreen extends StatefulWidget {
  const SOFUserDetailScreen({super.key});
  @override
  State<SOFUserDetailScreen> createState() => _SOFUsersDetailScreenState();
}

class _SOFUsersDetailScreenState extends State<SOFUserDetailScreen> {
  static int page = 1;
  static int userId = 139985;

  bool isLoading = false;

  late SOFUserReputationProvider sofUserReputationProvider;
  late ScrollController _scrollController = ScrollController();
  @override
  void didChangeDependencies() {
    final navigationArgs =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    userId = navigationArgs.userId;
    super.didChangeDependencies();
    sofUserReputationProvider.fetchReputationListByUserID(userId, page);
    page++;
  }

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    super.initState();
    sofUserReputationProvider =
        Provider.of<SOFUserReputationProvider>(context, listen: false);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    sofUserReputationProvider.clear();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _getMoreData(page);
    }
  }

  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      await sofUserReputationProvider.fetchReputationListByUserID(userId, page);
      setState(() {
        isLoading = false;
        page++;
      });
    }
  }

  Widget _buildProgressIndicator() {
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
      child: Consumer<SOFUserReputationProvider>(
          builder: (context, provider, child) {
        final reputationList = provider.reputationList;

        return ListView.separated(
          itemCount: reputationList.length + 1,
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          itemBuilder: (BuildContext context, int index) {
            if (index == reputationList.length) {
              return _buildProgressIndicator();
            } else {
              final userReputation = reputationList[index];
              return UserReputationItem(
                reputationType: userReputation.reputationHistoryType,
                change: userReputation.reputationChange,
                createAt: userReputation.creationDate,
                postId: userReputation.postId,
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
          title: const Text("SOF User Reputation"),
        ),
        body: Container(
          child: _buildList(),
        ));
  }
}
