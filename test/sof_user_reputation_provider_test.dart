import 'package:sof_users/features/users/provider/sof_user_reputation_provider.dart';
import 'package:test/test.dart';

void main() {
  group('SOFUserReputationProvider Testing....', () {
    final provider = SOFUserReputationProvider();
    provider.addListener(() {});

    int page = 1;

    test('reputation list should empty at the fist time!', () {
      expect(provider.reputationList.length, 0);
    });

    test('add bookmark by userId', () {
      // TO DO
    });
  });
}
