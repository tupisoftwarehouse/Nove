abstract interface class AbstractKeyValueDatabase {
  T getItem<T>(
    String itemKeyName,
    T Function(String serializedData) getDeserializedData,
  );

  void setItem<T>(String itemKeyName, String Function() getSerializedData);
}
