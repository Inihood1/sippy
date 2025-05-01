class Session {
  final String id;
  final String inviterName;
  final List<String> participants;

  Session({
    required this.id,
    required this.inviterName,
    this.participants = const [],
  });

  Session copyWith({List<String>? participants}) {
    return Session(
      id: id,
      inviterName: inviterName,
      participants: participants ?? this.participants,
    );
  }
}
