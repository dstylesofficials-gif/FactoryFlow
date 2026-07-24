import 'package:flutter_test/flutter_test.dart';
import 'package:factoryflow/features/auth/domain/entities/user_entity.dart';
import 'package:factoryflow/features/auth/data/models/user_model.dart';

void main() {
  group('Auth Domain & Model Verification Tests', () {
    test('UserRole string parser returns correct enum values', () {
      expect(UserRole.fromString('factory_manager'), UserRole.factoryManager);
      expect(UserRole.fromString('super_admin'), UserRole.superAdmin);
      expect(UserRole.fromString('unknown_role'), UserRole.operator);
    });

    test('UserModel JSON serialization roundtrip works correctly', () {
      final jsonMap = {
        'id': 'usr-100',
        'email': 'admin@factoryflow.com',
        'full_name': 'Sarah Connor',
        'role': 'factory_manager',
        'factory_id': 'fac-01',
        'is_active': true,
      };

      final model = UserModel.fromJson(jsonMap);
      expect(model.id, 'usr-100');
      expect(model.email, 'admin@factoryflow.com');
      expect(model.fullName, 'Sarah Connor');
      expect(model.role, UserRole.factoryManager);

      final serialized = model.toJson();
      expect(serialized['id'], 'usr-100');
      expect(serialized['role'], 'factoryManager');
    });
  });
}
