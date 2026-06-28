/// Abstract interface for IoT device providers.
/// V1 has no IoT — this interface ensures future compatibility
/// with PowerPlug, Matter, MQTT, BLE, Zigbee, Thread, Home Assistant.
abstract class IoTDeviceProvider {
  String get protocolName;
  Future<void> connect();
  Future<void> disconnect();
  Future<bool> get isConnected;
  Stream<Map<String, dynamic>> get dataStream;
}

/// Abstract sensor data provider for future IoT sensors
abstract class SensorProvider {
  String get sensorType;
  Future<double> readValue();
  Stream<double> get valueStream;
}

/// Abstract prediction data provider — replaceable by TFLite later
abstract class PredictionProvider {
  Future<double> predict(List<double> historicalData);
  double get confidenceScore;
}
