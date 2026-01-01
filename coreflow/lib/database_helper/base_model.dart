/// Abstract base class that all models must implement.
abstract class BaseModel {
  /// Each model defines its table name.
  String get tableName;

  /// Convert model → Map (for DB insert/update)
  Map<String, dynamic> toMap();

  /// Factory constructor: Convert Map → Model
  BaseModel fromMap(Map<String, dynamic> map);
}
