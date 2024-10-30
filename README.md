# MCode Inferno Test Kit

[Inferno](https://github.com/inferno-community/inferno-core) Test Kit for testing FHIR resources meet the MCode IG.

## Instructions for Developing Your Test Kit

Refer to the Inferno documentation for information about [setting up
your development environment and running your Test Kit](https://inferno-framework.github.io/docs/getting-started/).

More information about what is included in this repository can be [found here](https://inferno-framework.github.io/docs/getting-started/repo-layout-and-organization.html).

## Documentation
- [Inferno documentation](https://inferno-framework.github.io/docs/)
- [Ruby API documentation](https://inferno-framework.github.io/inferno-core/docs/)
- [JSON API documentation](https://inferno-framework.github.io/inferno-core/api-docs/)

## Developing

When developing tests, Docker Compose's "watch" mode may be useful. This can be used either by running:

```sh
docker compose up --watch
```

Or by running the existing `./run.sh` script in one terminal and then:

```sh
docker compose watch
```

In another. Note that sometimes you may get a "Bad Gateway" message after a reload. In that case, in yet another terminal, run:

```sh
docker compose restart nginx
```

## Example Inferno Test Kits

A list of all Test Kits registered with the Inferno Team can be found on the [Test Kit Registry](https://inferno-framework.github.io/community/test-kits.html) page.

## License
Copyright 2024 TODO

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at
```
http://www.apache.org/licenses/LICENSE-2.0
```
Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.

## Trademark Notice

HL7, FHIR and the FHIR [FLAME DESIGN] are the registered trademarks of Health
Level Seven International and their use does not constitute endorsement by HL7.
