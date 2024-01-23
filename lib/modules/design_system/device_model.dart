import 'dart:convert';
import 'package:flutter/foundation.dart';

class Device {
  final int numberOfCommands;
  final List<Command> commands;

  Device({
    required this.numberOfCommands,
    required this.commands,
  });

  Device copyWith({
    int? numberOfCommands,
    List<Command>? commands,
  }) {
    return Device(
      numberOfCommands: numberOfCommands ?? this.numberOfCommands,
      commands: commands ?? this.commands,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numberOfCommands': numberOfCommands,
      'commands': commands.map((command) => command.toMap()).toList(),
    };
  }

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      numberOfCommands: map['numberOfCommands'] as int,
      commands: (map['commands'] as List<Map<String, dynamic>>)
          .map((command) => Command.fromMap(command))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Device.fromJson(String source) =>
      Device.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Device(numberOfCommands: $numberOfCommands, commands: $commands)';

  @override
  bool operator ==(covariant Device other) {
    if (identical(this, other)) return true;

    return other.numberOfCommands == numberOfCommands &&
        listEquals(other.commands, commands);
  }

  @override
  int get hashCode => numberOfCommands.hashCode ^ commands.hashCode;
}

class Command {
  final String name;
  final String description;
  final String functionality;

  Command({
    required this.name,
    required this.description,
    required this.functionality,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'functionality': functionality,
    };
  }

  factory Command.fromMap(Map<String, dynamic> map) {
    return Command(
      name: map['name'] as String,
      description: map['description'] as String,
      functionality: map['functionality'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Command.fromJson(String source) =>
      Command.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Command(name: $name, description: $description, functionality: $functionality)';

  @override
  bool operator ==(covariant Command other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.functionality == functionality;
  }

  @override
  int get hashCode =>
      name.hashCode ^ description.hashCode ^ functionality.hashCode;
}
