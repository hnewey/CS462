ruleset edmonds {
	meta {
		configure using api_key = ""
		
		provides 
				find_vin
	}
	
	global {
		find_vin = function(vin) {
			base_url = "https://api.edmunds.com/api/vehicle/v2/vins/#{vin}?fmt=json&api_key=#{api_key}";
			http:get(base_url);
		}
	}
}
