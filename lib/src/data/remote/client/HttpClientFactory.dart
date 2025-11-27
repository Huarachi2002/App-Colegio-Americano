import 'dart:io';
import 'package:http/io_client.dart';

/// Factory para crear clientes HTTP con configuración de timeout.
///
/// Esta clase centraliza la configuración de timeouts HTTP para evitar
/// que las conexiones se queden colgadas indefinidamente.
class HttpClientFactory {
  /// Timeout para establecer la conexión TCP/SSL.
  /// Si el servidor no responde en este tiempo, se cancela la conexión.
  static const Duration connectionTimeout = Duration(seconds: 15);

  /// Tiempo máximo que una conexión puede estar inactiva en el pool.
  /// Conexiones inactivas por más tiempo serán cerradas automáticamente.
  static const Duration idleTimeout = Duration(seconds: 30);

  /// Crea un IOClient configurado con timeouts para usar con Chopper.
  ///
  /// El [connectionTimeout] controla cuánto tiempo esperar para establecer
  /// una conexión. Si la conexión no se establece en ese tiempo, se lanza
  /// una excepción [SocketException].
  ///
  /// El [idleTimeout] controla cuánto tiempo una conexión puede estar
  /// inactiva antes de ser cerrada automáticamente.
  static IOClient createIOClient({
    Duration? customConnectionTimeout,
    Duration? customIdleTimeout,
  }) {
    final httpClient = HttpClient()
      ..connectionTimeout = customConnectionTimeout ?? connectionTimeout
      ..idleTimeout = customIdleTimeout ?? idleTimeout;

    return IOClient(httpClient);
  }

  /// Crea un HttpClient nativo de Dart con timeouts configurados.
  ///
  /// Útil si necesitas acceder directamente al HttpClient para
  /// configuraciones adicionales (como certificados SSL personalizados).
  static HttpClient createHttpClient({
    Duration? customConnectionTimeout,
    Duration? customIdleTimeout,
  }) {
    return HttpClient()
      ..connectionTimeout = customConnectionTimeout ?? connectionTimeout
      ..idleTimeout = customIdleTimeout ?? idleTimeout;
  }
}
