// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JdoodleLanguageAdapter extends TypeAdapter<JdoodleLanguage> {
  @override
  final int typeId = 2;

  @override
  JdoodleLanguage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JdoodleLanguage(
      name: fields[0] as String,
      code: fields[1] as String,
      versions: (fields[2] as List).cast<String>(),
      currVersionIndex: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, JdoodleLanguage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.versions)
      ..writeByte(3)
      ..write(obj.currVersionIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JdoodleLanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
