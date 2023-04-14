class SOFUserModal {
  BadgeCounts? badgeCounts;
  int? accountId;
  bool? isEmployee;
  int? lastModifiedDate;
  int? lastAccessDate;
  int? reputationChangeYear;
  int? reputationChangeQuarter;
  int? reputationChangeMonth;
  int? reputationChangeWeek;
  int? reputationChangeDay;
  int? reputation;
  int? creationDate;
  String? userType;
  int? userId;
  int? acceptRate;
  String? websiteUrl;
  String? link;
  String? profileImage;
  String? displayName;
  String? location;

  SOFUserModal(
      {this.badgeCounts,
      this.accountId,
      this.isEmployee,
      this.lastModifiedDate,
      this.lastAccessDate,
      this.reputationChangeYear,
      this.reputationChangeQuarter,
      this.reputationChangeMonth,
      this.reputationChangeWeek,
      this.reputationChangeDay,
      this.reputation,
      this.creationDate,
      this.userType,
      this.userId,
      this.acceptRate,
      this.websiteUrl,
      this.link,
      this.profileImage,
      this.displayName,
      this.location});

  SOFUserModal.fromJson(Map<String, dynamic> json) {
    badgeCounts = json['badge_counts'] != null
        ? BadgeCounts.fromJson(json['badge_counts'])
        : null;
    accountId = json['account_id'];
    isEmployee = json['is_employee'];
    lastModifiedDate = json['last_modified_date'];
    lastAccessDate = json['last_access_date'];
    reputationChangeYear = json['reputation_change_year'];
    reputationChangeQuarter = json['reputation_change_quarter'];
    reputationChangeMonth = json['reputation_change_month'];
    reputationChangeWeek = json['reputation_change_week'];
    reputationChangeDay = json['reputation_change_day'];
    reputation = json['reputation'];
    creationDate = json['creation_date'];
    userType = json['user_type'];
    userId = json['user_id'];
    acceptRate = json['accept_rate'];
    websiteUrl = json['website_url'];
    link = json['link'];
    profileImage = json['profile_image'];
    displayName = json['display_name'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (badgeCounts != null) {
      data['badge_counts'] = badgeCounts!.toJson();
    }
    data['account_id'] = accountId;
    data['is_employee'] = isEmployee;
    data['last_modified_date'] = lastModifiedDate;
    data['last_access_date'] = lastAccessDate;
    data['reputation_change_year'] = reputationChangeYear;
    data['reputation_change_quarter'] = reputationChangeQuarter;
    data['reputation_change_month'] = reputationChangeMonth;
    data['reputation_change_week'] = reputationChangeWeek;
    data['reputation_change_day'] = reputationChangeDay;
    data['reputation'] = reputation;
    data['creation_date'] = creationDate;
    data['user_type'] = userType;
    data['user_id'] = userId;
    data['accept_rate'] = acceptRate;
    data['website_url'] = websiteUrl;
    data['link'] = link;
    data['profile_image'] = profileImage;
    data['display_name'] = displayName;
    data['location'] = location;
    return data;
  }
}

class BadgeCounts {
  int? bronze;
  int? silver;
  int? gold;

  BadgeCounts({this.bronze, this.silver, this.gold});

  BadgeCounts.fromJson(Map<String, dynamic> json) {
    bronze = json['bronze'];
    silver = json['silver'];
    gold = json['gold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bronze'] = bronze;
    data['silver'] = silver;
    data['gold'] = gold;
    return data;
  }
}
