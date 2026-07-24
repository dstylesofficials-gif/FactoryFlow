import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:factoryflow/features/auth/domain/entities/user_entity.dart';
import 'package:factoryflow/features/auth/data/models/user_model.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('FactoryFlow Unit & Domain Verification Suite', () {
    test('UserRole string parser resolves default fallback correctly', () {
      expect(UserRole.fromString('super_admin'), UserRole.superAdmin);
      expect(UserRole.fromString('factory_manager'), UserRole.factoryManager);
      expect(UserRole.fromString('inventory_manager'), UserRole.inventoryManager);
      expect(UserRole.fromString('quality_inspector'), UserRole.qualityInspector);
      expect(UserRole.fromString('invalid_role'), UserRole.operator);
    });

    test('UserModel serializes to JSON correctly', () {
      const userModel = UserModel(
        id: 'usr-888',
        email: 'engineer@factoryflow.com',
        fullName: 'Principal Architect',
        role: UserRole.superAdmin,
        factoryId: 'fac-99',
      );

      final json = userModel.toJson();
      expect(json['id'], 'usr-888');
      expect(json['email'], 'engineer@factoryflow.com');
      expect(json['full_name'], 'Principal Architect');
      expect(json['factory_id'], 'fac-99');
    });
  });
}
