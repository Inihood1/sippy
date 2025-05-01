import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sippy/routes/app_router.dart';

import '../../providers/session_provider.dart';

@RoutePage()
class InviteLandingScreen extends StatefulWidget {
  final String sessionId;
  const InviteLandingScreen({
    @PathParam('sessionId') required this.sessionId,
    super.key,
  });

  @override
  State<InviteLandingScreen> createState() => _InviteLandingScreenState();
}

class _InviteLandingScreenState extends State<InviteLandingScreen> {

  final _friendNameController = TextEditingController();

  @override
  void dispose() {
    _friendNameController.dispose();
    super.dispose();
  }

  void _startShopping() {
    final friendName = _friendNameController.text.trim();
    if (friendName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your name')),
      );
      return;
    }

    // Join the session
    final sessionProv = context.read<SessionProvider>();
    sessionProv.joinSession(widget.sessionId, friendName);

    context.router.replace(ProductListRoute());
  }

  @override
  Widget build(BuildContext context) {
    // Get inviter name from provider (if already created); fallback if missing
    final sessionProv = context.watch<SessionProvider>();
    final inviterName = sessionProv.currentSession?.inviterName ??
        'Your friend';

    return Scaffold(
      appBar: AppBar(title: Text('Join Shopping Session')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$inviterName is inviting you to shop!',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,
            ),
            SizedBox(height: 24),
            TextField(
              controller: _friendNameController,
              decoration: InputDecoration(
                labelText: 'Your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _startShopping,
                child: Text('Start Shopping'),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
