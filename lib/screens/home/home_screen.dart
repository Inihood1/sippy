import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../routes/app_router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop With Friends')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Welcome to SIPPPY!!'),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.group_add),
                label: const Text('Start a New Session'),
                onPressed: () {
                  context.router.push(CartInviteRoute());
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.link),
                label: const Text('Join as Friend'),
                onPressed: () => _showJoinDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showJoinDialog(BuildContext context) {
    final _linkController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Enter Invite Link'),
        content: TextField(
          controller: _linkController,
          decoration: const InputDecoration(
            hintText: 'app://shop/session/xyz123',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final link = _linkController.text.trim();
              if (_isValidLink(link)) {
                final sessionId = _extractSessionId(link);
                Navigator.of(ctx).pop();
                context.router.push(InviteLandingRoute(
                  sessionId: sessionId,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Invalid link format')),
                );
              }
            },
            child: const Text('Join'),
          ),
        ],
      ),
    );
  }

  bool _isValidLink(String link) {
    return link.startsWith('app://shop/session/');
  }

  String _extractSessionId(String link) {
    return link.replaceFirst('app://shop/session/', '');
  }
}
