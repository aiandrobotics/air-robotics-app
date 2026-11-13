import 'package:flutter/foundation.dart';

/// Represents a persistent registered/paired robot in the user's fleet.
@immutable
class RegisteredRobot {
  final String id;
  final String name;
  final String modelNumber;
  final DateTime pairedAt;
  final String? customNickname;

  const RegisteredRobot({
    required this.id,
    required this.name,
    this.modelNumber = 'Fabrica',
    required this.pairedAt,
    this.customNickname,
  });

  /// The user-visible display name: custom nickname if configured, else advertised name.
  String get displayName => (customNickname != null && customNickname!.trim().isNotEmpty)
      ? customNickname!.trim()
      : name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'modelNumber': modelNumber,
        'pairedAt': pairedAt.toIso8601String(),
        if (customNickname != null) 'customNickname': customNickname,
      };

  factory RegisteredRobot.fromJson(Map<String, dynamic> json) {
    final rawModel = json['modelNumber'] as String? ?? 'Fabrica';
    return RegisteredRobot(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'AIR Robot',
      modelNumber: rawModel == 'Fabrica-DevKit-v1' ? 'Fabrica' : rawModel,
      pairedAt: json['pairedAt'] != null
          ? DateTime.parse(json['pairedAt'] as String)
          : DateTime.now(),
      customNickname: json['customNickname'] as String?,
    );
  }

  RegisteredRobot copyWith({
    String? id,
    String? name,
    String? modelNumber,
    DateTime? pairedAt,
    String? customNickname,
  }) =>
      RegisteredRobot(
        id: id ?? this.id,
        name: name ?? this.name,
        modelNumber: modelNumber ?? this.modelNumber,
        pairedAt: pairedAt ?? this.pairedAt,
        customNickname: customNickname ?? this.customNickname,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisteredRobot &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          modelNumber == other.modelNumber &&
          pairedAt == other.pairedAt &&
          customNickname == other.customNickname;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      modelNumber.hashCode ^
      pairedAt.hashCode ^
      customNickname.hashCode;
}
