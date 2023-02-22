class User {
  /// Id of user.
  String? id;
  /// Name of user.
  String? name;
  /// JIC email notification to users will be implemented.
  String? email;
  /// Image stored in both offline persistence (eg Hive or .xml) and Supabase.
  String? profilePictureUrl;
  /// Array referring to 'id' of other User classes.
  List<String>? contacts;
  /// Status whether 'offline' or 'online', default 'offline'
  String status;
  /// Time the user was created in the database.
  DateTime? created;

  /// Constructor
  User({
    this.id,
    required this.name,
    required this.email,
    required this.profilePictureUrl,
    required this.contacts,
    this.status = 'offline',
    this.created,
  });

  /// Converts a Supabase row into a User object.
  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String?,
      name: map['name'] as String?,
      email: map['email'] as String?,
      profilePictureUrl: map['profile_picture_url'] as String?,
      contacts: (map['contacts'] as List<dynamic>?)
          ?.map((id) => id as String)
          .toList(),
      status: map['status'] as String,
      created: DateTime.parse(map['created'] as String),
    );
  }

  /// Converts a User object into a Map that can be saved to Supabase.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profile_picture_url': profilePictureUrl,
      'contacts': contacts,
      'status' : status,
      'created': created?.toIso8601String(),
    };
  }
}
