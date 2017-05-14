ruleset test_edmonds_api {
	meta {
		use module edmonds_keys
		use module edmonds_api
				with api_key = keys:edmonds("api_key")
	}

	rule test_api {
		select when test vin
    send_directive("VIN") with
				VIN = edmonds_api:find_vin(event:attr("vin").defaultsTo("JNKCV51E06M521497"))
	}
}
