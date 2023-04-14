import 'package:sof_users/features/users/provider/sof_users_provider.dart';
import 'package:test/test.dart';

void main() {
  group('SOFUsersProvider Testing....', () {
    final usersProvider = SOFUsersProvider();
    usersProvider.addListener(() {});

    int page = 1;

    test('userList and bookmark added should empty at the fist time!', () {
      expect(usersProvider.userList.length, 0);
      expect(usersProvider.bookmarkAddedMap.isEmpty, true);
    });

    test('fetch user data list with page index', () async {
      // TO DO
    });

    test('add bookmark by userId', () {
      // TO DO
    });

    test('remove bookmark by userId', () {
      // TO DO
    });

    test('filter bookmark added', () {
      // TO DO
    });
  });
}
