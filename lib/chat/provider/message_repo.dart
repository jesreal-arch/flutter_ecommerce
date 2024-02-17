import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/chat/chat_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'message_repo.g.dart';

@riverpod
MessageRepo messageRepo(MessageRepoRef _) => MessageRepo();

class MessageRepo {
  RealtimeChannel get messageChannel =>
      Supabase.instance.client.channel('public:message_table');

  Future<List<MessageModel>> showMessages() => Supabase.instance.client
      .from('message_table')
      .select('*')
      .then((value) => value.map((e) => MessageModel.fromJson(e)).toList());
}
