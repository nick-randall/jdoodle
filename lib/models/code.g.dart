// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CodeAdapter extends TypeAdapter<Code> {
  @override
  final int typeId = 0;

  @override
  Code read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Code(
      language: fields[2] as JdoodleLanguage,
      fileName: fields[1] as String?,
      text: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Code obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fileName)
      ..writeByte(2)
      ..write(obj.language)
      ..writeByte(3)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
