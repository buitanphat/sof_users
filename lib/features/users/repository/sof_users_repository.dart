import 'package:sof_users/common/api/api.dart';
import 'package:sof_users/common/const.dart';
import 'package:sof_users/features/users/modal/sof_user.dart';

class SOFUserRepository {
  final Api _api = Api();

  Future<List<SOFUserModal>> fetchSOFUserList(int page) async {
    final response = await _api.get(
        "${ApiUrl.sofUserListUrl}?page=$page&pagesize=30&site=stackoverflow");
    List<SOFUserModal> userList = <SOFUserModal>[];
    if (response['items'] != null) {
      response['items'].forEach((v) {
        userList.add(SOFUserModal.fromJson(v));
      });
    }
    return userList;
  }
}
