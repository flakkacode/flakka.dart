import 'package:core_persistence_proto/flakkasdk/persistence/v1/persistence_local.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class CorePersistentLocalClientFactory {
  PersistenceLocalClient create(
    ClientChannel channel, {
    required String instanceRef,
    required String instanceHead,
  }) =>
      PersistenceLocalClient(
        channel,
        options: CallOptions(
          metadata: {
            'instance_ref': instanceRef,
            'instance_head': instanceHead,
          },
        ),
      );
}
