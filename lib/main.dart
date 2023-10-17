import 'dart:convert';
import 'dart:async';

// Initializing a stream controller
StreamController<String> controller = StreamController<String>();

StreamController<String> controller1 = StreamController<String>.broadcast();

// Creating a new stream through the controller
Stream<String> stream = controller.stream;
Stream<String> stream1 = controller1.stream;

void main() {
  // Setting up a subscriber to listen for any events sent on the stream
  StreamSubscription<String> subscriber = stream.listen((String data) {
    print(data);
  }, onError: (error) {
    print(error);
  }, onDone: () {
    print('Stream closed!');
  });

  StreamSubscription<String> subscriber1 = stream1.listen((String data) {
    print('Subscriber1: ${data}');
  }, onError: (error) {
    print('Subscriber1: ${error}');
  }, onDone: () {
    print('Subscriber1: Stream closed');
  });

  // Setting up another subscriber to listen for any events sent on the stream
  StreamSubscription<String> subscriber2 = stream1.listen((String data) {
    print('Subscriber2: ${data}');
  }, onError: (error) {
    print('Subscriber2: ${error}');
  }, onDone: () {
    print('Subscriber2: Stream closed');
  });

  // Adding a data event to the stream with the controller
  controller.sink.add('Hello!');

  controller1.sink.add('Broadcase steam 1');
  controller1.sink.add('Broadcase 2');

  // Adding an error event to the stream with the controller
  controller.addError('Hi!');

  // Closing the stream with the controller
  controller.close();
  controller1.close();
}
