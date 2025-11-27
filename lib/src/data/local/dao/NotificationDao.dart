
import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/dao/BaseDao.dart';
import 'package:colegio_americano/src/data/local/table/Notifications.dart';

import 'package:drift/drift.dart';

part 'NotificationDao.g.dart';

@DriftAccessor(tables: [Notifications])
class NotificationDao extends DatabaseAccessor<AppDatabase>
    with _$NotificationDaoMixin, BaseDao<Notifications, Notification> {

  NotificationDao(AppDatabase db):super(db);

  Stream<List<Notification>> getNotificationsAsFuture(){
    return (select(notifications)
      ..orderBy([(n) => OrderingTerm.desc(n.id)])).watch();
  }

  Stream<Notification> getNotificationByIdAsStream(int notificationId){
    return (select(notifications)
      ..where((n) => n.id.equals(notificationId)))
        .watchSingle();
  }

  @override
  TableInfo<Notifications, Notification> getTable() => notifications;
}