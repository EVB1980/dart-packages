/// Describes numbers types
enum NumberTypes {
  byte(1),
  int16(2),
  int32(3),
  int64(4),
  double(5);

  const NumberTypes(this.type);

  final int type;

  int getBytesCount() {
    return switch (this) {
      NumberTypes.byte => 1,
      NumberTypes.int16 => 2,
      NumberTypes.int32 => 4,
      NumberTypes.int64 => 8,
      NumberTypes.double => 8
    };
  }

  static const int MIN_INT = -1 << 53;
  static const int MAX_INT = (1 << 53) - 1;

  static const int MIN_UINT64 = 0;
  static const int MAX_UINT64 = 1 << 54;

  static const int MIN_INT32 = -1 << 31;
  static const int MAX_INT32 = (1 << 31) - 1;

  static const int MIN_UINT32 = 0;
  static const int MAX_UINT32 = 1 << 32;

  static const int MIN_INT16 = -1 << 15;
  static const int MAX_INT16 = (1 << 15) - 1;

  static const int MIN_UINT16 = 0;
  static const int MAX_UINT16 = 1 << 16;

  static const int MIN_INT8 = -1 << 7;
  static const int MAX_INT8 = (1 << 7) - 1;

  static const int MIN_UINT8 = 0;
  static const int MAX_UINT8 = 1 << 8;

  factory NumberTypes.get(num value) {
    if (value is int) {
      return switch (value) {
        >= MIN_INT8 && <= MAX_INT8 => NumberTypes.byte,
        >= MIN_INT16 && <= MAX_INT16 => NumberTypes.int16,
        >= MIN_INT32 && <= MAX_INT32 => NumberTypes.int32,
        _ => NumberTypes.int64
      };
    } else {
      return NumberTypes.double;
    }
  }
}
