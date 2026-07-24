import 'package:equatable/equatable.dart';

enum UserRole {
  superAdmin,
  factoryManager,
  plantSupervisor,
  inventoryManager,
  qualityInspector,
  operator,
  auditor;

  static UserRole fromString(String role) {
    switch (role.toLowerCase()) {
      case 'super_admin':
        return UserRole.superAdmin;
      case 'factory_manager':
        return UserRole.factoryManager;
      case 'plant_supervisor':
        return UserRole.plantSupervisor;
      case 'inventory_manager':
        return UserRole.inventoryManager;
      case 'quality_inspector':
        return UserRole.qualityInspector;
      case 'auditor':
        return UserRole.auditor;
      default:
        return UserRole.operator;
    }
  }

  String toFormattedString() {
    switch (this) {
      case UserRole.superAdmin:
        return 'Super Admin';
      case UserRole.factoryManager:
        return 'Factory Manager';
      case UserRole.plantSupervisor:
        return 'Plant Supervisor';
      case UserRole.inventoryManager:
        return 'Inventory Manager';
      case UserRole.qualityInspector:
        return 'Quality Inspector';
      case UserRole.auditor:
        return 'Auditor';
      case UserRole.operator:
        return 'Operator';
    }
  }
}

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String fullName;
  final UserRole role;
  final String? factoryId;
  final String? avatarUrl;
  final bool isActive;

  const UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    this.factoryId,
    this.avatarUrl,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [
    id,
    email,
    fullName,
    role,
    factoryId,
    avatarUrl,
    isActive,
  ];
}
