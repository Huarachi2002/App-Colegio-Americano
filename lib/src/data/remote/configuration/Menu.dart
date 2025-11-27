class Menu {

  static const MENU_CONFIG = [
    {//Father Menu
      'news': true,
      'equipments': true,
      'annotations': true,
      'notifications': true,
      'reports': true,
      'permissions': false,
      'licenses': true
    },
    {//Employee Menu
      'news': true,
      'equipments': false,
      'annotations': false,
      'notifications': true,
      'reports': false,
      'permissions': false,
      'licenses': false
    },
    {//Father_Employee Menu
      'news': true,
      'equipments': true,
      'annotations': true,
      'notifications': true,
      'reports': true,
      'permissions': false,
      'licenses': true
    },
    {//Students
      'news': true,
      'equipments':false,
      'annotations':false,
      'notifications': true,
      'reports': false,
      'permissions': false,
      'licenses': false
    },
    {//The last always be the default menu configuration
      'news': true,
      'equipments': false,
      'annotations': false,
      'notifications': true,
      'reports': false,
      'permissions': false,
      'licenses': false
    }
  ];

}