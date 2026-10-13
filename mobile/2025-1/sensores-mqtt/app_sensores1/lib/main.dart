import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(const SensorMonitorApp());
}

class SensorMonitorApp extends StatelessWidget {
  const SensorMonitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitor Industrial 4.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SensorDashboard(),
    );
  }
}

class SensorDashboard extends StatefulWidget {
  const SensorDashboard({super.key});

  @override
  _SensorDashboardState createState() => _SensorDashboardState();
}

class _SensorDashboardState extends State<SensorDashboard> {
  final MqttClient client = MqttClient('broker.emqx.io', '');
  Map<String, double> sensorData = {
    'temperatura': 0,
    'umidade': 0,
    'vibracao': 0,
    'pressao': 0,
  };

  @override
  void initState() {
    super.initState();
    _connectToMqtt();
  }

  Future<void> _connectToMqtt() async {
    client.logging(on: true);
    client.keepAlivePeriod = 30;
    
    final connMessage = MqttConnectMessage()
        .withClientIdentifier('flutter_client')
        .startClean();
    
    client.connectionMessage = connMessage;

    try {
      await client.connect();
      client.subscribe('industrial/sensores/#', MqttQos.atLeastOnce);
      client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final recv = c[0].payload as MqttPublishMessage;
        final topic = c[0].topic;
        final payload = MqttPublishPayload.bytesToStringAsString(recv.payload.message);
        
        setState(() {
          if (topic.contains('temperatura')) {
            sensorData['temperatura'] = double.parse(payload);
          } else if (topic.contains('umidade')) {
            sensorData['umidade'] = double.parse(payload);
          }
          // Adicione outros sensores conforme necessário
        });
      });
    } catch (e) {
      debugPrint('Erro MQTT: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitor Industrial 4.0'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Configurações do app
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Painel de status
            _buildStatusPanel(),
            const SizedBox(height: 20),
            // Gauges para visualização
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  _buildGauge('Temperatura', sensorData['temperatura']!, '°C', 0, 100),
                  _buildGauge('Umidade', sensorData['umidade']!, '%', 0, 100),
                  _buildGauge('Vibração', sensorData['vibracao']!, 'Hz', 0, 50),
                  _buildGauge('Pressão', sensorData['pressao']!, 'kPa', 0, 500),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshData,
        tooltip: 'Atualizar',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildStatusPanel() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatusIndicator('KUKA', Colors.green),
            _buildStatusIndicator('SCHULEI', Colors.green),
            _buildStatusIndicator('Gateway', client.connectionStatus?.state == MqttConnectionState.connected 
                ? Colors.green : Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(String label, Color color) {
    return Column(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  Widget _buildGauge(String title, double value, String unit, double min, double max) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            Expanded(
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: min,
                    maximum: max,
                    ranges: <GaugeRange>[
                      GaugeRange(startValue: min, endValue: max*0.6, color: Colors.green),
                      GaugeRange(startValue: max*0.6, endValue: max*0.8, color: Colors.orange),
                      GaugeRange(startValue: max*0.8, endValue: max, color: Colors.red),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(value: value),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text('$value $unit'),
                        positionFactor: 0.5,
                        angle: 90,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _refreshData() {
    // Implemente a atualização manual dos dados
    setState(() {});
  }

  @override
  void dispose() {
    client.disconnect();
    super.dispose();
  }
}