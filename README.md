# Web-apps deployment

This repository aims to deploy some web apps along with the nginx-proxy usign
docker and docker-compose.

This project is based on the following:

- [jwilder/nginx-proxy](https://hub.docker.com/r/jwilder/nginx-proxy) 

- [Wordpress](https://hub.docker.com/_/wordpress) 

- [Nextcloud](https://hub.docker.com/_/nextcloud)

## How to use

Clone the repository and use the script `deploy-all.sh` to deploy all the
applications in this project.

```[bash]
./deploy-all.sh
```

The script receives the following environment variables:

| Variable     | Default          |
| -------------| ---------------- |
| HOST_DOMAIN  | localhost        |
| EMAIL_DOMAIN | mail@example.com |
| WP_DB_PASS   | mywppass         |
| NEXT_DB_PASS | mynextpass       |
| WITH_NGINX   |   (none)         |

These variables could be declared inline or exported globally.


## License

Copyright 2021 Luighi Vitón-Zorrilla

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	 http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
