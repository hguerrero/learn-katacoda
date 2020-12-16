This guide demonstrates how your Quarkus application can utilize the Apache Kafka Streams API to implement stream processing applications based on Apache Kafka.

### Kafka Streams

Kafka Streams is a client library for processing and analyzing data stored in Kafka. It has become a popular way to build streaming applications because of some interesting features like:

- Being able to embbed in Java applications as it is a simple and lightweight library.
- Can be run an application that has no other dependencies than Apache Kafka.
- Has an efficient and fast local state storage for stateful operations.
- Offers a high-level domaing specific language (DSL) and a Processor API to simplify operations.

### Kafka Streams extension

The Quarkus extension for Kafka Streams allows for very fast turnaround times during development by supporting the Quarkus Dev Mode (e.g. via `./mvnw compile quarkus:dev)`. After changing the code of your Kafka Streams topology, the application will automatically be reloaded when the next input message arrives.
