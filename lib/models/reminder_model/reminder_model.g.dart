// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RemainderAdapter extends TypeAdapter<Remainder> {
  @override
  final int typeId = 5;

  @override
  Remainder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Remainder(
      description: fields[0] as String,
      amount: fields[1] as int,
      date: fields[2] as DateTime,
      time: fields[3] as TimeOfDay,
      type: fields[4] as CatagoryType,
    );
  }

  @override
  void write(BinaryWriter writer, Remainder obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RemainderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
