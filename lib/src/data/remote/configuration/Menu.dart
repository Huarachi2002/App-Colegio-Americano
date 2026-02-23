class Menu {
  static const MENU_CONFIG = [
    {
      //Father Menu - index 0
      'news': true,
      'equipments': false, // Oculto para versión sencilla
      'annotations': false, // Oculto para versión sencilla
      'notifications': false, // Oculto para versión sencilla
      'reports': false, // Oculto para versión sencilla
      'permissions': false,
      'licenses': false, // Oculto para versión sencilla
      'payments': true // Solo pagos visibles para padres
    },
    {
      //Employee Menu - index 1
      'news': true,
      'equipments': false,
      'annotations': false,
      'notifications': false,
      'reports': false,
      'permissions': false,
      'licenses': false,
      'payments': false // Empleados no ven pagos
    },
    {
      //Father_Employee Menu - index 2
      'news': true,
      'equipments': false, // Oculto para versión sencilla
      'annotations': false, // Oculto para versión sencilla
      'notifications': false, // Oculto para versión sencilla
      'reports': false, // Oculto para versión sencilla
      'permissions': false,
      'licenses': false, // Oculto para versión sencilla
      'payments': true // Padre-Empleado sí ve pagos
    },
    {
      //Students - index 3
      'news': true,
      'equipments': false,
      'annotations': false,
      'notifications': false,
      'reports': false,
      'permissions': false,
      'licenses': false,
      'payments': false // Estudiantes no ven pagos
    },
    {
      //The last always be the default menu configuration - index 4
      'news': true,
      'equipments': false,
      'annotations': false,
      'notifications': false,
      'reports': false,
      'permissions': false,
      'licenses': false,
      'payments': false // Por defecto sin pagos
    }
  ];
}
