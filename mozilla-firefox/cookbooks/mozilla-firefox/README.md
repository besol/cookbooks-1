# mozilla-firefox-cookbook

This cookbook installs a build of Firefox from Mozilla

## Supported Platforms

* Ubuntu

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['mozilla-firefox']['64']</tt></td>
    <td>Boolean</td>
    <td>Install 64-bit version</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['mozilla-firefox']['version']</tt></td>
    <td>String</td>
    <td>Version to install</td>
    <td><tt>31.0</tt></td>
  </tr>
  <tr>
    <td><tt>['mozilla-firefox']['language']</tt></td>
    <td>String</td>
    <td>Language to install</td>
    <td><tt>en-US</tt></td>
  </tr>
</table>

## Usage

### mozilla-firefox::default

Include `mozilla-firefox` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[mozilla-firefox::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write chefsepc and/or serverspec tests for your change
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors


Author:: Brian Pitts (brian.pitts@lonelyplanet.com)

```text
Copyright 2014, Lonely Planet

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
