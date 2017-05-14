ruleset test_edmonds_api {
	meta {
		use module keys
		use module edmonds
				with api_key = keys:edmonds("api_key")
	}

	rule test_api {
		select when test vin
    send_directive("VIN") with
				VIN = edmonds:find_vin(event:attr("vin").defaultsTo("JNKCV51E06M521497"))
	}
}
