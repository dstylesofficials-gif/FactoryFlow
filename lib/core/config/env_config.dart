import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Centralized Environment Configuration Manager
/// Ensures zero hardcoded credentials and high portability across environments.
class EnvConfig {
  static Future<void> init() async {
    try {
      await dotenv.load(fileName: '.env');
    } catch (_) {
      // Fallback if .env is missing in containerized test environments
    }
  }

  static String get supabaseUrl =>
      dotenv.env['SUPABASE_URL'] ??
      const String.fromEnvironment(
        'SUPABASE_URL',
        defaultValue: 'https://demo-factoryflow.supabase.co',
      );

  static String get supabaseAnonKey =>
      dotenv.env['SUPABASE_ANON_KEY'] ??
      const String.fromEnvironment(
        'SUPABASE_ANON_KEY',
        defaultValue: 'demo-anon-key',
      );

  static String get appName =>
      dotenv.env['APP_NAME'] ?? 'FactoryFlow Enterprise';

  static String get appEnvironment =>
      dotenv.env['APP_ENVIRONMENT'] ?? 'development';

  static bool get enableRealtime =>
      dotenv.env['ENABLE_REALTIME_UPDATES'] == 'true';
}
