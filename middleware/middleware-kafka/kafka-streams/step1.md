You start this scenario with a basic Maven-based application created using the Quarkus maven plugin.

### Add extension

The current project needs the extensions to be added to integrate Quarkus with Apache Kafka.

Change the current folder to the project one:

``cd /opt/projects/kafka-streams``{{execute}}

Install the extension into the project with the following command:

``mvn quarkus:add-extension -Dextensions="quarkus-kafka-streams"``{{execute}}

>The first time you add the extension, new dependencies may be downloaded via maven. This should only happen once, after that things will go even faster.

This will add the necessary entries in your `pom.xml`{{open}} to bring in the Kafka extension. You should see a fragment similar to this around line 51:

```xml
...
<dependency>
    <groupId>io.quarkus</groupId>
    <artifactId>quarkus-kafka-streams</artifactId>
</dependency>
...
```

### Configure application

The Kafka Streams extension is configured via the Quarkus configuration file `application.properties`.

Open the `src/main/resources/application.properties`{{open}} file to add the following configuration:

<pre class="file" data-filename="./src/main/resources/application.properties" data-target="replace">
# Configuration file
quarkus.kafka-streams.bootstrap-servers=localhost:9092
quarkus.kafka-streams.application-server=${hostname}:8080
quarkus.kafka-streams.topics=weather-stations,temperature-values

# pass-through options
kafka-streams.cache.max.bytes.buffering=10240
kafka-streams.commit.interval.ms=1000
kafka-streams.metadata.max.age.ms=500
kafka-streams.auto.offset.reset=earliest
kafka-streams.metrics.recording.level=DEBUG
</pre>

> You can click in **Copy to Editor** to add the values into the file

The options with the `quarkus.kafka-streams` prefix can be changed dynamically at application startup, e.g. via environment variables or system properties. `bootstrap-servers` and `application-server` are mapped to the Kafka Streams properties `bootstrap.servers` and `application.server`, respectively. `topics` is specific to Quarkus: the application will wait for all the given topics to exist before launching the Kafka Streams engine. This is to done to gracefully await the creation of topics that don’t yet exist at application startup time.
