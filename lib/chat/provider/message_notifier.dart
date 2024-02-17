import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/chat/chat_model.dart';
import 'package:riverpod_app/chat/provider/chatprovider.dart';
import 'package:riverpod_app/chat/provider/message_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'message_notifier.g.dart';

@riverpod
class MessageNotifier extends _$MessageNotifier {
  @override
  Future<List<MessageModel>> build() async {
    _initMessageChannel();
    return ref.read(messageRepoProvider).showMessages();
  }

  void _initMessageChannel() {
    ref
        .read(messageRepoProvider)
        .messageChannel
        .onPostgresChanges(
            schema: 'public',
            table: 'message_table',
            event: PostgresChangeEvent.all,
            callback: ((payload) {
              print(payload);
            }))
        .subscribe();
  }
}
