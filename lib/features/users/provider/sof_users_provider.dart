import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sof_users/common/api/api_response.dart';
import 'package:sof_users/features/users/modal/sof_user.dart';
import 'package:sof_users/features/users/repository/sof_users_repository.dart';

const userBoodMarkMap = "user_bookmark_map";

class SOFUsersProvider extends ChangeNotifier {
  final SOFUserRepository _repository = SOFUserRepository();
  late ApiResponse<List<SOFUserModal>> apiResponse;
  late SharedPreferences prefs;
  late bool isFilterBookmark = false;

  List<SOFUserModal> userList = [];
  List<SOFUserModal> userBookmarkAddedList = [];

  Map<String, dynamic> bookmarkAddedMap = {};

  getCurrentSOFUserList() {
    return isFilterBookmark ? userBookmarkAddedList : userList;
  }

  loadLocalBookmark() async {
    prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(userBoodMarkMap);
    if (data == null) {
      bookmarkAddedMap = {};
    } else {
      bookmarkAddedMap = jsonDecode(data);
    }
  }

  fetchUsersList(int page) async {
    try {
      final List<SOFUserModal> newUserList =
          await _repository.fetchSOFUserList(page);
      userList = [...userList, ...newUserList];
    } catch (e) {
      apiResponse = ApiResponse.error(e.toString());
    } finally {
      notifyListeners();
    }
  }

  bookmarkUserById(String userId) async {
    if (bookmarkAddedMap.containsKey(userId.toString())) {
      bookmarkAddedMap.remove(userId);
    } else {
      bookmarkAddedMap[userId] = userId;
    }
    String jsonString = jsonEncode(bookmarkAddedMap);
    await prefs.setString(userBoodMarkMap, jsonString);
    notifyListeners();
  }

  filterBookmarkAdded() async {
    if (!isFilterBookmark) {
      isFilterBookmark = true;
      userBookmarkAddedList = userList
          .where((userModal) =>
              bookmarkAddedMap.containsKey(userModal.userId?.toString()))
          .toList();
    } else {
      isFilterBookmark = false;
      userBookmarkAddedList = [];
    }
    notifyListeners();
  }

  clear() {
    userList.clear();
    userBookmarkAddedList.clear();
    bookmarkAddedMap.clear();
  }
}
