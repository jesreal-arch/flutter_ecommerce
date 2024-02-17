import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
part 'supabase_services.g.dart';

@Riverpod()
Future<void> loginSupabase(
  LoginSupabaseRef ref,
  String emailUser,
  String passwordUser,
) async {
  await Supabase.instance.client.from('users').insert({
    'email': emailUser,
    'password': passwordUser,
  });
}
