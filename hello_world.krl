ruleset hello_world {
  meta {
    name "Hello World"
    description <<
A first ruleset for the Quickstart
>>
    author "Phil Windley"
    logging on
    shares hello, __testing
  }
  
  global {
    hello = function(obj) {
      msg = "Hello " + obj;
      msg
    }
__testing = { "queries": [ { "name": "hello", "args": [ "obj" ] },
                           { "name": "__testing" } ],
              "events": [ { "domain": "echo", "type": "hello",
                            "attrs": [ "name" ] },
			  { "domain": "echo", "type": "monkey",
			    "attrs": [ "name" ] },
			  { "domain": "echo", "type": "monkeyter",
			    "attrs": [ "name" ] } 
			]
            }
  }
  
  rule hello_world {
    select when echo hello
    pre {
      name = event:attr("name")
    }
    send_directive("say") with
      something = "Hello " + name
  }

  rule hello_monkey {
    select when echo monkey
    pre {
      name = event:attr("name").defaultsTo("Monkey");
    }
    send_directive("say") with
      something = "Hello " + name
  }
  
  rule hello_monkey_ter {
    select when echo monkeyter
    pre {
      name = event:attr("name").match(re//) => "Monkey" | event:attr("name");
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
