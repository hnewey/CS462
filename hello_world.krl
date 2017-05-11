ruleset hello_world {
  meta {
    name "Hello World"
    description <<
A first ruleset for the Quickstart
>>
    author "Phil Windley"
    logging on
    shares hello
  }
  
  global {
    hello = function(obj) {
      msg = "Hello " + obj;
      msg
    }
  }
  
  rule hello_world {
    select when echo hello
    pre {
      name = event:attr("name").klog("received name: ")
    }
    send_directive("say") with
      something = "Hello " + name
  }
  
  rule hello_worldy {
    select when ecco hello
    send_directive("no") with
      something = "I said yes!"
  }
  
}
