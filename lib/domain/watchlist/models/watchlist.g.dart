// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WatchListAdapter extends TypeAdapter<WatchList> {
  @override
  final int typeId = 0;

  @override
  WatchList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WatchList(
      movieimage: fields[0] as String,
      moviename: fields[1] as String,
      movierating: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WatchList obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.movieimage)
      ..writeByte(1)
      ..write(obj.moviename)
      ..writeByte(2)
      ..write(obj.movierating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatchListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
