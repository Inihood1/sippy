import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/session.dart';

class SessionProvider with ChangeNotifier {
  final _uuid = Uuid();

  Session? _currentSession;
  String? _currentUserName;

  Session? get currentSession => _currentSession;
  String? get currentUserName => _currentUserName;

  void createSession(String inviterName) {
    final sessionId = _uuid.v4();
    _currentSession = Session(id: sessionId, inviterName: inviterName);
    _currentUserName = inviterName;
    notifyListeners();
  }


  void joinSession(String sessionId, String friendName) {
    if (_currentSession == null || _currentSession!.id != sessionId) {
      _currentSession = Session(id: sessionId, inviterName: 'Unknown');
    }
    _currentUserName = friendName;
    final updatedParticipants = List<String>.from(_currentSession!.participants)
      ..add(friendName);
    _currentSession = _currentSession!.copyWith(
      participants: updatedParticipants,
    );
    notifyListeners();
  }

  void clearSession() {
    _currentSession = null;
    _currentUserName = null;
    notifyListeners();
  }
}
