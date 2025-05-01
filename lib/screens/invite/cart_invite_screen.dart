import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../providers/session_provider.dart';
import '../../routes/app_router.dart';

@RoutePage()
class CartInviteScreen extends StatefulWidget {
  const CartInviteScreen({super.key});

  @override
  State<CartInviteScreen> createState() => _CartInviteScreenState();
}

class _CartInviteScreenState extends State<CartInviteScreen> {

  final _nameController = TextEditingController();
  String? _inviteLink;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _createSession() {
    final inviterName = _nameController.text.trim();
    if (inviterName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your name')),
      );
      return;
    }
    final sessionProv = context.read<SessionProvider>();
    sessionProv.createSession(inviterName);
    final sessionId = sessionProv.currentSession!.id;
    setState(() {
      _inviteLink = 'app://shop/session/$sessionId';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Session created — you can now start shopping!')),
    );

    Future.delayed(Duration(milliseconds: 300), () {
      context.router.push(ProductListRoute());
    });

  }

  void _copyLink() {
    if (_inviteLink == null) return;
    Clipboard.setData(ClipboardData(text: _inviteLink!));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Link copied to clipboard!')),
    );
  }

  void _sendInvite() {
    if (_inviteLink == null) return;
    debugPrint('Invite link sent: $_inviteLink');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Invite sent!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Shopping Session')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Enter your name to start a shared cart session:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 12),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createSession,
              child: Text('Create Session'),
            ),
            if (_inviteLink != null) ...[
              Divider(height: 32),
              SelectableText(
                _inviteLink!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    icon: Icon(Icons.copy),
                    label: Text('Copy Link'),
                    onPressed: _copyLink,
                  ),
                  SizedBox(width: 16),
                  TextButton.icon(
                    icon: Icon(Icons.send),
                    label: Text('Send Invite'),
                    onPressed: _sendInvite,
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }


}
