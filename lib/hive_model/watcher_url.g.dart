// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watcher_url.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WatcherUrlAdapter extends TypeAdapter<WatcherUrl> {
  @override
  final int typeId = 1;

  @override
  WatcherUrl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WatcherUrl(
      name: fields[0] as String,
      url: fields[1] as String,
      service: fields[2] as int,
      active: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, WatcherUrl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.service)
      ..writeByte(3)
      ..write(obj.active);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatcherUrlAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
