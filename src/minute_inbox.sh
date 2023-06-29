#!/bin/bash

api="https://www.minuteinbox.com"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36"

function get_session_id() {
	response=$(curl --request GET \
		--url "$api" \
		--user-agent "$user_agent" \
		-i -s)
	session_id=$(echo "$response" | grep -iE '^set-cookie:' | awk '{print $2}')
}

function generate_email() {
	response=$(curl --request GET \
		--url "$api/index/index" \
		--user-agent "$user_agent" \
		--header "accept: application/json, text/javascript" \
		--header "x-requested-with: XMLHttpRequest" \
		--header "cookie: $session_id;" \
		-i -s)
	cookie=$(echo "$response" | grep -iE '^set-cookie:' | awk '{print $2}')
	echo $response
}

function refresh_email() {
	curl --request GET \
		--url "$api/index/refresh" \
		--user-agent "$user_agent" \
		--header "accept: application/json, text/javascript" \
		--header "x-requested-with: XMLHttpRequest" \
		--header "cookie: $session_id; $cookie"
}

function get_avatars() {
	curl --request POST \
		--url "$api/index/avatars/" \
		--user-agent "$user_agent" \
		--header "accept: application/json, text/javascript" \
		--header "x-requested-with: XMLHttpRequest" \
		--header "cookie: $session_id; $cookie"
}
