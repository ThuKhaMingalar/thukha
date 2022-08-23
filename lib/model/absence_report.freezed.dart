// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'absence_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AbsenceReport _$AbsenceReportFromJson(Map<String, dynamic> json) {
  return _AbsenceReport.fromJson(json);
}

/// @nodoc
mixin _$AbsenceReport {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String get absenceDate => throw _privateConstructorUsedError;
  String get absenceType => throw _privateConstructorUsedError;
  String get rName => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  String get ownerID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbsenceReportCopyWith<AbsenceReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsenceReportCopyWith<$Res> {
  factory $AbsenceReportCopyWith(
          AbsenceReport value, $Res Function(AbsenceReport) then) =
      _$AbsenceReportCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String position,
      String absenceDate,
      String absenceType,
      String rName,
      DateTime dateTime,
      String ownerID});
}

/// @nodoc
class _$AbsenceReportCopyWithImpl<$Res>
    implements $AbsenceReportCopyWith<$Res> {
  _$AbsenceReportCopyWithImpl(this._value, this._then);

  final AbsenceReport _value;
  // ignore: unused_field
  final $Res Function(AbsenceReport) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? position = freezed,
    Object? absenceDate = freezed,
    Object? absenceType = freezed,
    Object? rName = freezed,
    Object? dateTime = freezed,
    Object? ownerID = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      absenceDate: absenceDate == freezed
          ? _value.absenceDate
          : absenceDate // ignore: cast_nullable_to_non_nullable
              as String,
      absenceType: absenceType == freezed
          ? _value.absenceType
          : absenceType // ignore: cast_nullable_to_non_nullable
              as String,
      rName: rName == freezed
          ? _value.rName
          : rName // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ownerID: ownerID == freezed
          ? _value.ownerID
          : ownerID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AbsenceReportCopyWith<$Res>
    implements $AbsenceReportCopyWith<$Res> {
  factory _$$_AbsenceReportCopyWith(
          _$_AbsenceReport value, $Res Function(_$_AbsenceReport) then) =
      __$$_AbsenceReportCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String position,
      String absenceDate,
      String absenceType,
      String rName,
      DateTime dateTime,
      String ownerID});
}

/// @nodoc
class __$$_AbsenceReportCopyWithImpl<$Res>
    extends _$AbsenceReportCopyWithImpl<$Res>
    implements _$$_AbsenceReportCopyWith<$Res> {
  __$$_AbsenceReportCopyWithImpl(
      _$_AbsenceReport _value, $Res Function(_$_AbsenceReport) _then)
      : super(_value, (v) => _then(v as _$_AbsenceReport));

  @override
  _$_AbsenceReport get _value => super._value as _$_AbsenceReport;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? position = freezed,
    Object? absenceDate = freezed,
    Object? absenceType = freezed,
    Object? rName = freezed,
    Object? dateTime = freezed,
    Object? ownerID = freezed,
  }) {
    return _then(_$_AbsenceReport(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      absenceDate: absenceDate == freezed
          ? _value.absenceDate
          : absenceDate // ignore: cast_nullable_to_non_nullable
              as String,
      absenceType: absenceType == freezed
          ? _value.absenceType
          : absenceType // ignore: cast_nullable_to_non_nullable
              as String,
      rName: rName == freezed
          ? _value.rName
          : rName // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ownerID: ownerID == freezed
          ? _value.ownerID
          : ownerID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AbsenceReport implements _AbsenceReport {
  _$_AbsenceReport(
      {required this.id,
      required this.name,
      required this.position,
      required this.absenceDate,
      required this.absenceType,
      required this.rName,
      required this.dateTime,
      required this.ownerID});

  factory _$_AbsenceReport.fromJson(Map<String, dynamic> json) =>
      _$$_AbsenceReportFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String position;
  @override
  final String absenceDate;
  @override
  final String absenceType;
  @override
  final String rName;
  @override
  final DateTime dateTime;
  @override
  final String ownerID;

  @override
  String toString() {
    return 'AbsenceReport(id: $id, name: $name, position: $position, absenceDate: $absenceDate, absenceType: $absenceType, rName: $rName, dateTime: $dateTime, ownerID: $ownerID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AbsenceReport &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality()
                .equals(other.absenceDate, absenceDate) &&
            const DeepCollectionEquality()
                .equals(other.absenceType, absenceType) &&
            const DeepCollectionEquality().equals(other.rName, rName) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality().equals(other.ownerID, ownerID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(absenceDate),
      const DeepCollectionEquality().hash(absenceType),
      const DeepCollectionEquality().hash(rName),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(ownerID));

  @JsonKey(ignore: true)
  @override
  _$$_AbsenceReportCopyWith<_$_AbsenceReport> get copyWith =>
      __$$_AbsenceReportCopyWithImpl<_$_AbsenceReport>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AbsenceReportToJson(
      this,
    );
  }
}

abstract class _AbsenceReport implements AbsenceReport {
  factory _AbsenceReport(
      {required final String id,
      required final String name,
      required final String position,
      required final String absenceDate,
      required final String absenceType,
      required final String rName,
      required final DateTime dateTime,
      required final String ownerID}) = _$_AbsenceReport;

  factory _AbsenceReport.fromJson(Map<String, dynamic> json) =
      _$_AbsenceReport.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get position;
  @override
  String get absenceDate;
  @override
  String get absenceType;
  @override
  String get rName;
  @override
  DateTime get dateTime;
  @override
  String get ownerID;
  @override
  @JsonKey(ignore: true)
  _$$_AbsenceReportCopyWith<_$_AbsenceReport> get copyWith =>
      throw _privateConstructorUsedError;
}
