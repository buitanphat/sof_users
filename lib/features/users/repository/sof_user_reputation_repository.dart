import 'package:sof_users/common/api/api.dart';
import 'package:sof_users/common/const.dart';
import 'package:sof_users/features/users/modal/sof_user_reputation.dart';

class SOFUserReputationRepository {
  final Api _api = Api();

  Future<List<SOFUserReputationModal>> fetchReputationListByUserID(
      int userId, int page) async {
    final response = await _api.get(
        "${ApiUrl.sofUserListUrl}/$userId/reputation-history?page=$page&pagesize=30&site=stackoverflow");
    List<SOFUserReputationModal> userReputationList =
        <SOFUserReputationModal>[];
    if (response['items'] != null) {
      response['items'].forEach((v) {
        userReputationList.add(SOFUserReputationModal.fromJson(v));
      });
    }
    return userReputationList;
  }
}
