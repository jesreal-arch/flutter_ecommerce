import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user.g.dart';

@Riverpod()
Future<void> userAdd(UserAddRef ref, String currentUserToken) async {
  await Supabase.instance.client.from('users').insert({
    'token': currentUserToken,
  });
}
