// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SignUpAdapter extends TypeAdapter<SignUp> {
  @override
  final int typeId = 1;

  @override
  SignUp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SignUp(
      id: fields[0] as dynamic,
      email: fields[1] as dynamic,
      password: fields[2] as dynamic,
      user_name: fields[3] as dynamic,
      first_name: fields[4] as dynamic,
      last_name: fields[5] as dynamic,
      type: fields[6] as dynamic,
      address: fields[7] as dynamic,
      telephone: fields[8] as dynamic,
      telegram_id: fields[9] as dynamic,
      points: fields[10] as dynamic,
      reservation_allowed: fields[11] as dynamic,
      accessToken: fields[12] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, SignUp obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.user_name)
      ..writeByte(4)
      ..write(obj.first_name)
      ..writeByte(5)
      ..write(obj.last_name)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.address)
      ..writeByte(8)
      ..write(obj.telephone)
      ..writeByte(9)
      ..write(obj.telegram_id)
      ..writeByte(10)
      ..write(obj.points)
      ..writeByte(11)
      ..write(obj.reservation_allowed)
      ..writeByte(12)
      ..write(obj.accessToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignUpAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
