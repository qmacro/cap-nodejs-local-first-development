namespace org.qmacro.emitter;

@rest  @hcql
service EmitterService {
  action greet(greeting: String) returns String;

  event Greeting.Received {
    info : String;
  }
}
