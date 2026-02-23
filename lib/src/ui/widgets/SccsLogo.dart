import 'package:flutter/material.dart';

/// Widget de logo SCCS que respeta las reglas del Manual de Marca
///
/// Reglas del manual:
/// - Área de seguridad: padding alrededor del logo
/// - Tamaño mínimo horizontal: 45px de altura
/// - Tamaño mínimo vertical: 65px de altura
/// - Nunca distorsionar: usar BoxFit.contain
class SccsLogo extends StatelessWidget {
  /// Variante del logo a mostrar
  final SccsLogoVariant variant;

  /// Altura del logo (respeta mínimos del manual)
  final double? height;

  /// Ancho del logo
  final double? width;

  /// Para fondos oscuros, usar versión de escala de grises
  final bool forDarkBackground;

  const SccsLogo({
    super.key,
    this.variant = SccsLogoVariant.horizontal,
    this.height,
    this.width,
    this.forDarkBackground = false,
  });

  /// Logo horizontal para AppBar (altura mín: 45px)
  const SccsLogo.horizontal({
    super.key,
    this.height = 45,
    this.width,
    this.forDarkBackground = false,
  }) : variant = SccsLogoVariant.horizontal;

  /// Logo vertical para Login/Splash (altura mín: 65px)
  const SccsLogo.vertical({
    super.key,
    this.height = 120,
    this.width,
    this.forDarkBackground = false,
  }) : variant = SccsLogoVariant.vertical;

  @override
  Widget build(BuildContext context) {
    // Aplicar tamaños mínimos según manual de marca
    final minHeight = variant == SccsLogoVariant.horizontal ? 45.0 : 65.0;
    final effectiveHeight =
        height != null && height! >= minHeight ? height : minHeight;

    return Padding(
      // Área de seguridad alrededor del logo
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        _getLogoPath(),
        height: effectiveHeight,
        width: width,
        fit: BoxFit.contain, // NUNCA distorsionar el logo
      ),
    );
  }

  String _getLogoPath() {
    // Para fondos oscuros, usar escala de grises (temporal hasta tener logo blanco)
    if (forDarkBackground) {
      return variant == SccsLogoVariant.horizontal
          ? 'assets/logos/LogoSCCS-escala-de-grises.png'
          : 'assets/logos/LogoSCCS-escala-grises-vertical.png';
    }

    // Para fondos claros, usar logo a color
    return variant == SccsLogoVariant.horizontal
        ? 'assets/logos/LogoSCCS-color-horizontal.png'
        : 'assets/logos/LogoSCCS-color-vertical.png';
  }
}

/// Variantes del logo SCCS
enum SccsLogoVariant {
  /// Logo horizontal (escudo + texto al lado)
  /// Ideal para AppBar, headers
  horizontal,

  /// Logo vertical (escudo arriba, texto abajo)
  /// Ideal para Login, Splash, centrado
  vertical,
}
