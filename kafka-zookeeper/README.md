#### 进入容器
```
docker exec -it kafka_kafka bash
```
#### 创建topic “test2”

```
kafka-topics.sh --create --zookeeper 192.168.13.25:2181 --replication-factor 1 --partitions 3 --topic testHourly
```
#### 查看topic列表
```
kafka-topics.sh --list --zookeeper 192.168.13.10:2181
```

#### 发送消息
```
kafka-console-producer.sh --broker-list 192.168.13.10:9092 --topic test2
```

#### 读取消息

```
# 版本低的时候使用
kafka-console-consumer.sh --zookeeper 192.168.13.10:2181 --from-beginning --topic test2

# 版本高的时候使用
kafka-console-consumer.sh --bootstrap-server 192.168.13.10:9092 --from-beginning --topic test2

```

#### 查看topic详情
```
kafka-topics.sh --describe --zookeeper 192.168.13.10:2181 --topic test2
```


#### 其他

```
advertised.host.name = 192.168.13.10
        advertised.listeners = null
        advertised.port = 9092
        alter.config.policy.class.name = null
        alter.log.dirs.replication.quota.window.num = 11
        alter.log.dirs.replication.quota.window.size.seconds = 1
        authorizer.class.name =
        auto.create.topics.enable = true
        auto.leader.rebalance.enable = true
        background.threads = 10
        broker.id = -1
        broker.id.generation.enable = true
        broker.rack = null
        client.quota.callback.class = null
        compression.type = producer
        connection.failed.authentication.delay.ms = 100
        connections.max.idle.ms = 600000
        controlled.shutdown.enable = true
        controlled.shutdown.max.retries = 3
        controlled.shutdown.retry.backoff.ms = 5000
        controller.socket.timeout.ms = 30000
        create.topic.policy.class.name = null
        default.replication.factor = 1
        delegation.token.expiry.check.interval.ms = 3600000
        delegation.token.expiry.time.ms = 86400000
        delegation.token.master.key = null
        delegation.token.max.lifetime.ms = 604800000
        delete.records.purgatory.purge.interval.requests = 1
        delete.topic.enable = true
        fetch.purgatory.purge.interval.requests = 1000
        group.initial.rebalance.delay.ms = 0
        group.max.session.timeout.ms = 300000
        group.min.session.timeout.ms = 6000
        host.name =
        inter.broker.listener.name = null
        inter.broker.protocol.version = 2.1-IV2
        kafka.metrics.polling.interval.secs = 10
        kafka.metrics.reporters = []
        leader.imbalance.check.interval.seconds = 300
        leader.imbalance.per.broker.percentage = 10
        listener.security.protocol.map = PLAINTEXT:PLAINTEXT,SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT,SASL_SSL:SASL_SSL
        listeners = null
        log.cleaner.backoff.ms = 15000
        log.cleaner.dedupe.buffer.size = 134217728
        log.cleaner.delete.retention.ms = 86400000
        log.cleaner.enable = true
        log.cleaner.io.buffer.load.factor = 0.9
        log.cleaner.io.buffer.size = 524288
        log.cleaner.io.max.bytes.per.second = 1.7976931348623157E308
        log.cleaner.min.cleanable.ratio = 0.5
        log.cleaner.min.compaction.lag.ms = 0
        log.cleaner.threads = 1
        log.cleanup.policy = [delete]
        log.dir = /tmp/kafka-logs
        log.dirs = /kafka/kafka-logs-cb23c2f07d2f
        log.flush.interval.messages = 9223372036854775807
        log.flush.interval.ms = null
        log.flush.offset.checkpoint.interval.ms = 60000
        log.flush.scheduler.interval.ms = 9223372036854775807
        log.flush.start.offset.checkpoint.interval.ms = 60000
        log.index.interval.bytes = 4096
        log.index.size.max.bytes = 10485760
        log.message.downconversion.enable = true
        log.message.format.version = 2.1-IV2
        log.message.timestamp.difference.max.ms = 9223372036854775807
        log.message.timestamp.type = CreateTime
        log.preallocate = false
        log.retention.bytes = -1
        log.retention.check.interval.ms = 300000
        log.retention.hours = 168
        log.retention.minutes = null
        log.retention.ms = null
        log.roll.hours = 168
        log.roll.jitter.hours = 0
        log.roll.jitter.ms = null
        log.roll.ms = null
        log.segment.bytes = 1073741824
        log.segment.delete.delay.ms = 60000
        max.connections.per.ip = 2147483647
        max.connections.per.ip.overrides =
        max.incremental.fetch.session.cache.slots = 1000
        message.max.bytes = 1000012
        metric.reporters = []
        metrics.num.samples = 2
        metrics.recording.level = INFO
        metrics.sample.window.ms = 30000
        min.insync.replicas = 1
        num.io.threads = 8
        num.network.threads = 3
        num.partitions = 1
        num.recovery.threads.per.data.dir = 1
        num.replica.alter.log.dirs.threads = null
        num.replica.fetchers = 1
        offset.metadata.max.bytes = 4096
        offsets.commit.required.acks = -1
        offsets.commit.timeout.ms = 5000
        offsets.load.buffer.size = 5242880
        offsets.retention.check.interval.ms = 600000
        offsets.retention.minutes = 10080
        offsets.topic.compression.codec = 0
        offsets.topic.num.partitions = 50
        offsets.topic.replication.factor = 1
        offsets.topic.segment.bytes = 104857600
        password.encoder.cipher.algorithm = AES/CBC/PKCS5Padding
        password.encoder.iterations = 4096
        password.encoder.key.length = 128
        password.encoder.keyfactory.algorithm = null
        password.encoder.old.secret = null
        password.encoder.secret = null
        port = 9092
        principal.builder.class = null
        producer.purgatory.purge.interval.requests = 1000
        queued.max.request.bytes = -1
        queued.max.requests = 500
        quota.consumer.default = 9223372036854775807
        quota.producer.default = 9223372036854775807
        quota.window.num = 11
        quota.window.size.seconds = 1
        replica.fetch.backoff.ms = 1000
        replica.fetch.max.bytes = 1048576
        replica.fetch.min.bytes = 1
        replica.fetch.response.max.bytes = 10485760
        replica.fetch.wait.max.ms = 500
        replica.high.watermark.checkpoint.interval.ms = 5000
        replica.lag.time.max.ms = 10000
        replica.socket.receive.buffer.bytes = 65536
        replica.socket.timeout.ms = 30000
        replication.quota.window.num = 11
        replication.quota.window.size.seconds = 1
        request.timeout.ms = 30000
        reserved.broker.max.id = 1000
        sasl.client.callback.handler.class = null
        sasl.enabled.mechanisms = [GSSAPI]
        sasl.jaas.config = null
        sasl.kerberos.kinit.cmd = /usr/bin/kinit
        sasl.kerberos.min.time.before.relogin = 60000
        sasl.kerberos.principal.to.local.rules = [DEFAULT]
        sasl.kerberos.service.name = null
        sasl.kerberos.ticket.renew.jitter = 0.05
        sasl.kerberos.ticket.renew.window.factor = 0.8
        sasl.login.callback.handler.class = null
        sasl.login.class = null
        sasl.login.refresh.buffer.seconds = 300
        sasl.login.refresh.min.period.seconds = 60
        sasl.login.refresh.window.factor = 0.8
        sasl.login.refresh.window.jitter = 0.05
        sasl.mechanism.inter.broker.protocol = GSSAPI
        sasl.server.callback.handler.class = null
        security.inter.broker.protocol = PLAINTEXT
        socket.receive.buffer.bytes = 102400
        socket.request.max.bytes = 104857600
        socket.send.buffer.bytes = 102400
        ssl.cipher.suites = []
        ssl.client.auth = none
        ssl.enabled.protocols = [TLSv1.2, TLSv1.1, TLSv1]
        ssl.endpoint.identification.algorithm = https
        ssl.key.password = null
        ssl.keymanager.algorithm = SunX509
        ssl.keystore.location = null
        ssl.keystore.password = null
        ssl.keystore.type = JKS
        ssl.protocol = TLS
        ssl.provider = null
        ssl.secure.random.implementation = null
        ssl.trustmanager.algorithm = PKIX
        ssl.truststore.location = null
        ssl.truststore.password = null
        ssl.truststore.type = JKS
        transaction.abort.timed.out.transaction.cleanup.interval.ms = 60000
        transaction.max.timeout.ms = 900000
        transaction.remove.expired.transaction.cleanup.interval.ms = 3600000
        transaction.state.log.load.buffer.size = 5242880
        transaction.state.log.min.isr = 1
        transaction.state.log.num.partitions = 50
        transaction.state.log.replication.factor = 1
        transaction.state.log.segment.bytes = 104857600
        transactional.id.expiration.ms = 604800000
        unclean.leader.election.enable = false
        zookeeper.connect = zookeeper:2181
        zookeeper.connection.timeout.ms = 6000
        zookeeper.max.in.flight.requests = 10
        zookeeper.session.timeout.ms = 6000
        zookeeper.set.acl = false
        zookeeper.sync.time.ms = 2000

[2019-01-15 03:26:56,934] INFO KafkaConfig values:
        advertised.host.name = 192.168.13.10
        advertised.listeners = null
        advertised.port = 9092
        alter.config.policy.class.name = null
        alter.log.dirs.replication.quota.window.num = 11
        alter.log.dirs.replication.quota.window.size.seconds = 1
        authorizer.class.name =
        auto.create.topics.enable = true
        auto.leader.rebalance.enable = true
        background.threads = 10
        broker.id = -1
        broker.id.generation.enable = true
        broker.rack = null
        client.quota.callback.class = null
        compression.type = producer
        connection.failed.authentication.delay.ms = 100
        connections.max.idle.ms = 600000
        controlled.shutdown.enable = true
        controlled.shutdown.max.retries = 3
        controlled.shutdown.retry.backoff.ms = 5000
        controller.socket.timeout.ms = 30000
        create.topic.policy.class.name = null
        default.replication.factor = 1
        delegation.token.expiry.check.interval.ms = 3600000
        delegation.token.expiry.time.ms = 86400000
        delegation.token.master.key = null
        delegation.token.max.lifetime.ms = 604800000
        delete.records.purgatory.purge.interval.requests = 1
        delete.topic.enable = true
        fetch.purgatory.purge.interval.requests = 1000
        group.initial.rebalance.delay.ms = 0
        group.max.session.timeout.ms = 300000
        group.min.session.timeout.ms = 6000
        host.name =
        inter.broker.listener.name = null
        inter.broker.protocol.version = 2.1-IV2
        kafka.metrics.polling.interval.secs = 10
        kafka.metrics.reporters = []
        leader.imbalance.check.interval.seconds = 300
        leader.imbalance.per.broker.percentage = 10
        listener.security.protocol.map = PLAINTEXT:PLAINTEXT,SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT,SASL_SSL:SASL_SSL
        listeners = null
        log.cleaner.backoff.ms = 15000
        log.cleaner.dedupe.buffer.size = 134217728
        log.cleaner.delete.retention.ms = 86400000
        log.cleaner.enable = true
        log.cleaner.io.buffer.load.factor = 0.9
        log.cleaner.io.buffer.size = 524288
        log.cleaner.io.max.bytes.per.second = 1.7976931348623157E308
        log.cleaner.min.cleanable.ratio = 0.5
        log.cleaner.min.compaction.lag.ms = 0
        log.cleaner.threads = 1
        log.cleanup.policy = [delete]
        log.dir = /tmp/kafka-logs
        log.dirs = /kafka/kafka-logs-cb23c2f07d2f
        log.flush.interval.messages = 9223372036854775807
        log.flush.interval.ms = null
        log.flush.offset.checkpoint.interval.ms = 60000
        log.flush.scheduler.interval.ms = 9223372036854775807
        log.flush.start.offset.checkpoint.interval.ms = 60000
        log.index.interval.bytes = 4096
        log.index.size.max.bytes = 10485760
        log.message.downconversion.enable = true
        log.message.format.version = 2.1-IV2
        log.message.timestamp.difference.max.ms = 9223372036854775807
        log.message.timestamp.type = CreateTime
        log.preallocate = false
        log.retention.bytes = -1
        log.retention.check.interval.ms = 300000
        log.retention.hours = 168
        log.retention.minutes = null
        log.retention.ms = null
        log.roll.hours = 168
        log.roll.jitter.hours = 0
        log.roll.jitter.ms = null
        log.roll.ms = null
        log.segment.bytes = 1073741824
        log.segment.delete.delay.ms = 60000
        max.connections.per.ip = 2147483647
        max.connections.per.ip.overrides =
        max.incremental.fetch.session.cache.slots = 1000
        message.max.bytes = 1000012
        metric.reporters = []
        metrics.num.samples = 2
        metrics.recording.level = INFO
        metrics.sample.window.ms = 30000
        min.insync.replicas = 1
        num.io.threads = 8
        num.network.threads = 3
        num.partitions = 1
        num.recovery.threads.per.data.dir = 1
        num.replica.alter.log.dirs.threads = null
        num.replica.fetchers = 1
        offset.metadata.max.bytes = 4096
        offsets.commit.required.acks = -1
        offsets.commit.timeout.ms = 5000
        offsets.load.buffer.size = 5242880
        offsets.retention.check.interval.ms = 600000
        offsets.retention.minutes = 10080
        offsets.topic.compression.codec = 0
        offsets.topic.num.partitions = 50
        offsets.topic.replication.factor = 1
        offsets.topic.segment.bytes = 104857600
        password.encoder.cipher.algorithm = AES/CBC/PKCS5Padding
        password.encoder.iterations = 4096
        password.encoder.key.length = 128
        password.encoder.keyfactory.algorithm = null
        password.encoder.old.secret = null
        password.encoder.secret = null
        port = 9092
        principal.builder.class = null
        producer.purgatory.purge.interval.requests = 1000
        queued.max.request.bytes = -1
        queued.max.requests = 500
        quota.consumer.default = 9223372036854775807
        quota.producer.default = 9223372036854775807
        quota.window.num = 11
        quota.window.size.seconds = 1
        replica.fetch.backoff.ms = 1000
        replica.fetch.max.bytes = 1048576
        replica.fetch.min.bytes = 1
        replica.fetch.response.max.bytes = 10485760
        replica.fetch.wait.max.ms = 500
        replica.high.watermark.checkpoint.interval.ms = 5000
        replica.lag.time.max.ms = 10000
        replica.socket.receive.buffer.bytes = 65536
        replica.socket.timeout.ms = 30000
        replication.quota.window.num = 11
        replication.quota.window.size.seconds = 1
        request.timeout.ms = 30000
        reserved.broker.max.id = 1000
        sasl.client.callback.handler.class = null
        sasl.enabled.mechanisms = [GSSAPI]
        sasl.jaas.config = null
        sasl.kerberos.kinit.cmd = /usr/bin/kinit
        sasl.kerberos.min.time.before.relogin = 60000
        sasl.kerberos.principal.to.local.rules = [DEFAULT]
        sasl.kerberos.service.name = null
        sasl.kerberos.ticket.renew.jitter = 0.05
        sasl.kerberos.ticket.renew.window.factor = 0.8
        sasl.login.callback.handler.class = null
        sasl.login.class = null
        sasl.login.refresh.buffer.seconds = 300
        sasl.login.refresh.min.period.seconds = 60
        sasl.login.refresh.window.factor = 0.8
        sasl.login.refresh.window.jitter = 0.05
        sasl.mechanism.inter.broker.protocol = GSSAPI
        sasl.server.callback.handler.class = null
        security.inter.broker.protocol = PLAINTEXT
        socket.receive.buffer.bytes = 102400
        socket.request.max.bytes = 104857600
        socket.send.buffer.bytes = 102400
        ssl.cipher.suites = []
        ssl.client.auth = none
        ssl.enabled.protocols = [TLSv1.2, TLSv1.1, TLSv1]
        ssl.endpoint.identification.algorithm = https
        ssl.key.password = null
        ssl.keymanager.algorithm = SunX509
        ssl.keystore.location = null
        ssl.keystore.password = null
        ssl.keystore.type = JKS
        ssl.protocol = TLS
        ssl.provider = null
        ssl.secure.random.implementation = null
        ssl.trustmanager.algorithm = PKIX
        ssl.truststore.location = null
        ssl.truststore.password = null
        ssl.truststore.type = JKS
        transaction.abort.timed.out.transaction.cleanup.interval.ms = 60000
        transaction.max.timeout.ms = 900000
        transaction.remove.expired.transaction.cleanup.interval.ms = 3600000
        transaction.state.log.load.buffer.size = 5242880
        transaction.state.log.min.isr = 1
        transaction.state.log.num.partitions = 50
        transaction.state.log.replication.factor = 1
        transaction.state.log.segment.bytes = 104857600
        transactional.id.expiration.ms = 604800000
        unclean.leader.election.enable = false
        zookeeper.connect = zookeeper:2181
        zookeeper.connection.timeout.ms = 6000
        zookeeper.max.in.flight.requests = 10
        zookeeper.session.timeout.ms = 6000
        zookeeper.set.acl = false
        zookeeper.sync.time.ms = 2000


```
