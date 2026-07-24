import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/env_config.dart';

/// Initializes Supabase Service Instance safely
Future<void> initSupabase() async {
  await Supabase.initialize(
    url: EnvConfig.supabaseUrl,
    // ignore: deprecated_member_use
    anonKey: EnvConfig.supabaseAnonKey,
    debug: EnvConfig.appEnvironment == 'development',
  );
}

/// Supabase Client Provider for Dependency Injection across Data Sources
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});
