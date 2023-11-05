// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 1;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction(
      description: fields[0] as String,
      amount: fields[1] as int,
      date: fields[2] as DateTime,
      paymentMode: fields[4] as PaymentMode,
      catagoryType: fields[3] as CatagoryType?,
      transactionType: fields[5] as TransactionType,
    );
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.catagoryType)
      ..writeByte(4)
      ..write(obj.paymentMode)
      ..writeByte(5)
      ..write(obj.transactionType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatagoryTypeAdapter extends TypeAdapter<CatagoryType> {
  @override
  final int typeId = 2;

  @override
  CatagoryType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CatagoryType.bills;
      case 1:
        return CatagoryType.food;
      case 2:
        return CatagoryType.entertainment;
      case 3:
        return CatagoryType.transportation;
      case 4:
        return CatagoryType.shopping;
      case 5:
        return CatagoryType.insurance;
      case 6:
        return CatagoryType.others;
      default:
        return CatagoryType.bills;
    }
  }

  @override
  void write(BinaryWriter writer, CatagoryType obj) {
    switch (obj) {
      case CatagoryType.bills:
        writer.writeByte(0);
        break;
      case CatagoryType.food:
        writer.writeByte(1);
        break;
      case CatagoryType.entertainment:
        writer.writeByte(2);
        break;
      case CatagoryType.transportation:
        writer.writeByte(3);
        break;
      case CatagoryType.shopping:
        writer.writeByte(4);
        break;
      case CatagoryType.insurance:
        writer.writeByte(5);
        break;
      case CatagoryType.others:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatagoryTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PaymentModeAdapter extends TypeAdapter<PaymentMode> {
  @override
  final int typeId = 3;

  @override
  PaymentMode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PaymentMode.cash;
      case 1:
        return PaymentMode.bank;
      default:
        return PaymentMode.cash;
    }
  }

  @override
  void write(BinaryWriter writer, PaymentMode obj) {
    switch (obj) {
      case PaymentMode.cash:
        writer.writeByte(0);
        break;
      case PaymentMode.bank:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionTypeAdapter extends TypeAdapter<TransactionType> {
  @override
  final int typeId = 4;

  @override
  TransactionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransactionType.income;
      case 1:
        return TransactionType.expense;
      default:
        return TransactionType.income;
    }
  }

  @override
  void write(BinaryWriter writer, TransactionType obj) {
    switch (obj) {
      case TransactionType.income:
        writer.writeByte(0);
        break;
      case TransactionType.expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
