import 'package:flutter/material.dart';
import 'package:sof_users/common/api/api_response.dart';
import 'package:sof_users/features/users/modal/sof_user_reputation.dart';
import 'package:sof_users/features/users/repository/sof_user_reputation_repository.dart';

class SOFUserReputationProvider extends ChangeNotifier {
  final SOFUserReputationRepository _repository = SOFUserReputationRepository();
  late ApiResponse<List<SOFUserReputationModal>> apiResponse;

  List<SOFUserReputationModal> reputationList = [];

  fetchReputationListByUserID(int userID, int page) async {
    try {
      final List<SOFUserReputationModal> newList =
          await _repository.fetchReputationListByUserID(userID, page);
      reputationList = [...reputationList, ...newList];
    } catch (e) {
      apiResponse = ApiResponse.error(e.toString());
    } finally {
      notifyListeners();
    }
  }

  clear() {
    reputationList.clear();
  }
}
