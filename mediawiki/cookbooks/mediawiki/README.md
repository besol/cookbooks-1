# mediawiki

Configures a system to run mediawiki. It will install and configure MySQL, Apache, and PHP.
This cookbook downloads the specified version of mediawiki, untars it, and drops it in your desired location.
You will need to configure the wiki for yourself.

## Supported Platforms

CentOS/RHEL 6

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['mediawiki']['enable_https']</tt></td>
    <td>Boolean</td>
    <td>whether to include apache2::mod_ssl</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['mediawiki']['version']</tt></td>
    <td>String</td>
    <td>Version number of mediawiki to install</td>
    <td><tt>1.24.0</tt></td>
  </tr>
  <tr>
    <td><tt>['mediawiki']['path']</tt></td>
    <td>String</td>
    <td>Location to install mediawiki files</td>
    <td><tt>/var/www/html/wiki</tt></td>
  </tr>
  <tr>
    <td><tt>['mediawiki']['mysql_host']</tt></td>
    <td>String</td>
    <td>Location of MySQL Server</td>
    <td><tt>localhost</tt></td>
  </tr>
  <tr>
    <td><tt>['mediawiki']['mysql_password']</tt></td>
    <td>String</td>
    <td>MySQL root user password</td>
    <td><tt>randompassword</tt></td>
  </tr>
  <tr>
    <td><tt>['mediawiki']['mysql_dbname']</tt></td>
    <td>String</td>
    <td>Wiki database name</td>
    <td><tt>wiki</tt></td>
  </tr>
  <tr>
    <td><tt>['mediawiki']['mysql_dbuser']</tt></td>
    <td>String</td>
    <td>Wiki MySQL password</td>
    <td><tt>wiki_user</tt></td>
  </tr>
  <tr>
    <td><tt>['mediawiki']['mysql_dbpass']</tt></td>
    <td>String</td>
    <td>Wiki MySQL user password</td>
    <td><tt>wiki_pass</tt></td>
  </tr>
</table>

## Usage

### mediawiki::default

Include `mediawiki` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[mediawiki::default]"
  ]
}
```

## License and Authors

Author:: Patrick Moore (<moore267@marshall.edu>)
